<?php
namespace backend\models;

use Yii;
use common\models\User;
use yii\data\ActiveDataProvider;

class UserSearch extends User{
    
    public function rules() {
        return [
            [['status'], 'integer'],
            [['name','contact_number','email'], 'safe'],
        ];
    }
    public function search($params) {
        $query = User::find();
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => ['created_at'=> SORT_DESC],
                'attributes' => ['name', 'contact_number', 'email', 'created_at']]
        ]);

        $this->load($params);
        if (!$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere([
            'status' => $this->status
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'contact_number', $this->contact_number])
            ->andFilterWhere(['like', 'email', $this->email]);

        return $dataProvider;
    }
}
?>