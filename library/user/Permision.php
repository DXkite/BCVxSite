<?php

namespace user; 

use archive\Archive;
use archive\Condition;
use archive\Statement;

class Permision extends Archive {
    protected static $_fields=['gid','uid','name','sort','upload'];
    // 是否为可用字段
    protected function _isField($name){
        return in_array($name,self::$_fields);
    }
    public function getTableName():string
    {
        return 'user_permision';
    }

}

/**
* DTA FILE:
; 权限表
gid int(11) auto primary  comment="分组ID"
uid bigint(20) unique  comment="用户ID"
name varchar(80) key comment="分组名"
sort int(11) key comment="排序索引"
; 权限设置
upload enum('Y','N') default='N' comment="上传文件"
*/