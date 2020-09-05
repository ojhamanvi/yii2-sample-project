<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "user_detail".
 *
 * @property int $id
 * @property int $user_id
 * @property string $profile_pic
 * @property string $dob
 * @property string $address
 * @property string $city
 * @property int $state
 * @property int $country
 * @property int $status
 * @property string $created_at
 * @property string $ipaddr
 */
class UserDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'profile_pic', 'dob', 'address', 'city', 'state', 'country', 'status', 'ipaddr'], 'required'],
            [['user_id', 'state', 'country', 'status'], 'integer'],
            [['dob', 'created_at'], 'safe'],
            [['profile_pic', 'address'], 'string', 'max' => 255],
            [['city'], 'string', 'max' => 100],
            [['ipaddr'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'profile_pic' => 'Profile Pic',
            'dob' => 'Dob',
            'address' => 'Address',
            'city' => 'City',
            'state' => 'State',
            'country' => 'Country',
            'status' => 'Status',
            'created_at' => 'Created At',
            'ipaddr' => 'Ipaddr',
        ];
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\UserDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\UserDetailQuery(get_called_class());
    }
}
