<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use backend\models\SignupForm;
use yii\db\Query;
use common\models\States;
use backend\models\UserSearch;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error','signup','state','update','view','delete'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                    'delete' => ['POST'],
                ],
            ],
        ];
    }
    

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    

    public function actionSignup()
    {
        $model = new SignupForm();
        $model->setScenario(SignupForm::SCENARIOCREATE);
        try{
            if (Yii::$app->request->isPost && $model->load(Yii::$app->request->post()) && $model->validate()) {
                $model->signup();
                Yii::$app->session->setFlash('success', 'Congratulations!!...User registered successfully...');
                return $this->redirect(['/site/index']);
            }
        }catch( ErrorException $ex){
            Yii::$app->session->setFlash('error',$ex->getMessage());
            return $this->redirect(['/site/signup']);
        }
        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    public function actionIndex(){
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index',[
        'searchModel' => $searchModel,
        'dataProvider' => $dataProvider,
    ]);
    }


    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            $model->password = '';

            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    public function actionState($id = null) {
        \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        $post = Yii::$app->request->post();
        $model = (new Query())->select('*')->from(States::tableName())
                ->where(['country_id' => $post['depdrop_all_params']['country']])
                ->orderBy(['state_name' => SORT_ASC])
                ->all();
        if (!$model) {
            return ['output' => '', 'selected' => ''];
        }
        $st = [];
        foreach ($model as $state) {
            $st[] = ['id' => $state['id'], 'name' => $state['state_name']];
        }
        return ['output' => $st, 'selected' => $id];
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }


    public function actionView($id)
    {   
        $model = new SignupForm();
        $model->setData($id);
        return $this->render('view', [
            'model' => $model,
        ]);
    }

    public function actionUpdate($id)
    {       
        $model = new SignupForm();
        try{
        $model->setScenario(SignupForm::SCENARIOUPDATE);
        $model->setUpdateData($id);
        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->update($id)) {
            Yii::$app->session->setFlash('success', 'User Updated Successfully!');
            return $this->redirect(['/site/view', 'id' => $id]);
        }
    }catch( ErrorException $ex){
        Yii::$app->session->setFlash('error',$ex->getMessage());
        return $this->redirect(['/site/index']);
    }
        return $this->render('update', [
            'model' => $model,
        ]);
    }

    public function actionDelete($id)
    {
        try{
            $model = new SignupForm(); 
            $model->deleteUser($id);
            Yii::$app->session->setFlash('success','User Deleted Successfully');
            return $this->redirect(['/site/index']);
        }catch( ErrorException $ex){
            Yii::$app->session->setFlash('error',$ex->getMessage());
            return $this->redirect(['/site/index']);
        }
    }

}
