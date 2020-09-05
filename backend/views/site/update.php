<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\depdrop\DepDrop;
use common\helpers\CommonHelper;
use yii\helpers\Url;

$this->title = 'Update';
$this->params['breadcrumbs'][] = $this->title;
$model->country = 102;
?>
<div class="site-login">
    <div class="row">
        <div class="col-xs-12 col-md-8 col-md-offset-2">
        <div class="panel panel-default">
 			<div class="panel-heading">
 				<h1 class="panel-title"><?= $this->title ?></h1>
                 <p>Please fill out the following fields to Register the User:</p>
 			</div>
            <div class="panel-body">
            <?php $form = ActiveForm::begin(['id' => 'signup-form']); ?>
            <div class="col-md-6">
                <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>  
            </div> 
            <div class="col-md-6">
                <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>
                </div> 
            <div class="col-md-12">
                <?= $form->field($model, 'email')->textInput(['autofocus' => true,'type'=>'email']) ?>
            </div>           
            
            <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'contact_number')->textInput() ?>
            </div> 
            
            <div class="col-md-6">
                <?= $form->field($model,'profile_pic')->fileInput(['class' => 'empPic']) ?>
            </div> 
            </div>
            <div class="row">
            <div class="col-md-6">
                <?= $form->field($model, 'dob')->textInput(['type'=>'date']) ?>
            </div> 
            <div class="col-md-6">
                <?= $form->field($model, 'city')->textInput() ?>
            </div> 
            </div>
            <div class="col-md-12">
                <?= $form->field($model, 'address')->textInput() ?>
            </div>             
            <div class="col-md-6">
                <?= $form->field($model, 'country')->dropDownList(
                CommonHelper::getCountries(),['prompt' => 'Select Country','id' => 'country']); ?>               
            </div>
            <div class="col-md-6">
            <?=  $form->field($model, 'state')->widget(DepDrop::classname(), [
                    'options' => ['id'=>'state'],
                    'pluginOptions'=>[
                        'depends'=>['country'],
                        'initialize' => true,
                        'placeholder' => 'Select...',
                        'url' => Url::to(['/site/state','id'=> $model->state])
                    ]
                ]);
                ?>
            <div>                
            <div class="form-group">
                <?= Html::submitButton('Register', ['class' => 'btn btn-primary pull-right', 'name' => 'signup-button']) ?>
            </div>

            <?php ActiveForm::end(); ?>
            </div>
        </div>
        </div>
        </div>
    </div>
</div>
