<?php 
use yii\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;
?>

<?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'filterPosition' => GridView::FILTER_POS_HEADER,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
                'name',
                'contact_number',
                'email',
                [
                    'attribute'=>'status',
                    'filter'=> Yii::$app->params['status'],
                    'format' => 'html',
                    'value' => function($model) {
                        $lbt = $model->status == 1 ? 'success' : 'warning';
                        return "<span class='label label-{$lbt}'>".Yii::$app->params['status'][$model->status].'</span>';
                    },
                ],
                [
                    'attribute' => 'created_at',
                    
                ],
                [
                    'class' => 'yii\grid\ActionColumn',
                   
                    
                ]
            ],
        ]);
         ?>