<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "states".
 *
 * @property int $id
 * @property int $country_id
 * @property string $state_name
 */
class States extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'states';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['country_id', 'state_name'], 'required'],
            [['country_id'], 'integer'],
            [['state_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'country_id' => 'Country ID',
            'state_name' => 'State Name',
        ];
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\StatesQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\StatesQuery(get_called_class());
    }
}
