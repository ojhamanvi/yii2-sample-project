<?php
namespace backend\models;

use Yii;
use yii\base\Model;
use common\models\User;
use common\models\UserDetail;
use yii\web\UploadedFile;
use yii\base\ErrorException;
use yii\helpers\Url;
use \yii\db\Query;
use yii\db\Expression;
use yii\web\NotFoundHttpException;

class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $name;
    public $confirm_password;
    public $contact_number;
    public $profile_pic;
    public $dob;
    public $address;
    public $city;
    public $state;
    public $country;
    protected $userData = [];

    const SCENARIOUPDATE = 'scenarioupdate';
    const SCENARIOCREATE = 'scenariocreate';
    public function rules()
    {
        return [
            [['username','email','password','contact_number','address','name'], 'trim'],
            [['username','email','contact_number','address','name','state','country','city','dob'], 'required'],
            ['email', 'email'],
            [['password'],'required','on' => self::SCENARIOCREATE],
            ['email', 'string', 'max' => 255],           
            ['username', 'unique', 'targetClass' => '\common\models\User','on' => self::SCENARIOCREATE, 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],        
            ['email', 'unique', 'targetClass' => '\common\models\User', 'on' => self::SCENARIOCREATE,'message' => 'This email address has already been taken.'],
            ['password', 'required'],
            ['password', 'string', 'min' => Yii::$app->params['user.passwordMinLength']],
            [['profile_pic'], 'file', 'extensions' => 'jpg,jpeg,png','skipOnEmpty' => true,'maxSize' => 1024*1024 ],
            ['confirm_password', 'compare', 'compareAttribute'=>'password'],
        ];
    }

    public function scenarios() {
        return [
            self::SCENARIOUPDATE => ['username','email','contact_number','dob', 'name', 'state','country','address', 'city','status'],
            self::SCENARIOCREATE => ['username','password','confirm_password', 'name', 'country','city','dob','email','contact_number', 'address','state', 'profile_pic'],
        ];
    }

    public function signup()
    {
       
        $model = new User();
        $model->setAttributes($this->getAttributes());  
        $model->status = 1;
        $model->auth_key = md5(random_bytes(5));
        $model->password_hash = $this->createPassword(); 
        $model->created_at = date('Y-m-d H:i:s');
        $model->updated_at = date('Y-m-d H:i:s');            
        if (!$model->save()) {
            throw new ErrorException(json_encode($model->getErrors()));            
        }
        
        $user = new UserDetail();
        $user->user_id = $model->id;
        $user->setAttributes($this->getAttributes());        
        $user->profile_pic = $this->uploadFile();
        $user->created_at = date('Y-m-d H:i:s');
        $user->ipaddr = Yii::$app->request->userIP;
        $user->status=1;
        if (!$user->save()) {
            throw new ErrorException(json_encode($model->getErrors()));                
        }
 

    }

    public function uploadFile()
    {
        $uploaded_file = UploadedFile::getInstance($this, $attribute='profile_pic');
        
        if ($uploaded_file != null) 
           {
              $path_back = Url::to('@backend/web/images/users/');
              $path_front = Url::to('@frontend/web/images/users/');
              $filename = str_replace('/', '-', Yii::$app->controller->id) . '-' . $attribute . '-id_' . Yii::$app->user->id . '.' . $uploaded_file->extension;
            
            $upload_path_back = $path_back .$filename;  
            $upload_path_front = $path_front .$filename;  
            if(!is_dir( $path_back)){
                mkdir($path_back,0777);
            }
            if(!is_dir($path_front)){
                mkdir($path_front,0777);
            }    
           
            $uploaded_file->saveAs($upload_path_front,FALSE);  
            $uploaded_file->saveAs($upload_path_back);     
            return $filename;
        }
        return false;
    }
    
    public function setData($id){
        
        $details = $this->setUserDetails($id);        
        $this->userData = $details;
    }

    public function setUpdateData($id){
        
        $detail = $this->setUserDetails($id);        
        $this->setAttributes([
            'name'=> $detail['name'],
            'username'=>$detail['username'],
            'contact_number'=>$detail['contact_number'],
            'email'=>$detail['email'],
            'profile_pic'=>$detail['profile_pic'] ,
            'dob'=>$detail['dob'],
            'address'=>$detail['address'],
            'city'=>$detail['city'],
            'state'=>$detail['state'],
            'country'=>$detail['country'],


        ]);
    }



    private function setUserDetails($id){
        $exp = new Expression('user_detail.*,user.username,user.name,user.contact_number,user.email');
        $query = new Query;
        $query->select($exp)
        ->from('user_detail')
        ->join('LEFT JOIN', 'user', 'user_detail.user_id = user.id')
        ->where(['user.id' => $id]);
        $data =  $query->all(); 
        if(!count($data)){
            throw new NotFoundHttpException();           
        }
        return $data[0];
   
    }

    public function getUserDetail(){
        return $this->userData ;
    }

    public function deleteUser($id){
        $model = UserDetail::findOne(['user_id'=>$id]);
       
        $model->status = 2;
        $model->save();
        $user = User::findOne($id);
        $user->status = 2;
        $user->save();
       
    }

    public function update($id)
    {
       
        $model = User::findOne($id);
        $model->setAttributes($this->getAttributes());  
        $model->status = 1;
        $model->updated_at = date('Y-m-d H:i:s');            
        if (!$model->save()) {
            throw new ErrorException(json_encode($model->getErrors()));            
        }
        return true;
    }



    private function createPassword(){
        return Yii::$app->getSecurity()->generatePasswordHash($this->password);
    }
}
