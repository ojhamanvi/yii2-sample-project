<?php

namespace common\helpers;

use Yii;
use common\models\Country;
use common\models\States;
use yii\db\Query;
use yii\helpers\ArrayHelper;
use yii\helpers\BaseArrayHelper;

class CommonHelper extends BaseArrayHelper {

    public static function getCountries() {
        $model = (new Query())->select('*')
                        ->from(Country::tableName())
                        ->orderBy(['name' => SORT_ASC])->all();
        if (!$model) {
            return [];
        }
        return ArrayHelper::map($model, 'id', 'name');
    }

}