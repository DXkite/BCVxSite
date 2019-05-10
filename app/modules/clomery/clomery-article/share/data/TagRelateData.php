<?php
namespace clomery\article\data;

use JsonSerializable;
use suda\application\database\DataObject;
use suda\orm\struct\TableStruct;
use suda\orm\struct\TableStructCreateInterface;
use support\openmethod\RequestInputTrait;
use support\openmethod\MethodParameterInterface;


/**
 * Class TagRelateData
 * @package clomery\article\data
 */
class TagRelateData  extends DataObject implements MethodParameterInterface, JsonSerializable, TableStructCreateInterface
{
    use RequestInputTrait;

    /**
     * 创建数据表结构
     *
     * @param TableStruct $struct 父级或初始数据表结构
     * @return TableStruct
     */
    public static function createTableStruct(TableStruct $struct): TableStruct
    {
        $struct->setName('tag_relate');
        $struct->fields([
            $struct->field('id', 'bigint', 20)->primary()->unsigned()->auto(),
            $struct->field('relate', 'bigint', 20)->unsigned()->key()->comment('相关对象'),
            $struct->field('tag', 'bigint', 20)->unsigned()->key()->comment('标签'),
        ]);
        return $struct;
    }
}