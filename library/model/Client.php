<?php
namespace model;

use Query;

class Client
{
    const ACTIVE=1;//可活动的
    const FREEZE=0;//禁用的
    public function create(string  $name, string $description='官方令牌', int $state=self::ACTIVE)
    {
        $token=md5(microtime(true));
        $id=Query::insert('token_client', ['name'=>$name, 'description'=>$description, 'time'=>time(), 'token'=>$token, 'state'=>$state]);
        return ['id'=>$id,'token'=>$token];
    }
    public function setState(int $id, int $state)
    {
        return Query::update('token_client', ['state'=>$state], ['id'=>$id]);
    }
    public function list(int $state=null)
    {
        if (is_null($state)) {
            return Query::where('token_client')->fetchAll();
        }
        return Query::where('token_client', '*', ['state'=>$state])->fetchAll();
    }
    public function check(int $id, string $token)
    {
        return Query::where('token_client', 'id', ['id'=>$id, 'token'=>$token, 'state'=>self::ACTIVE])->fetch()?true:false;
    }
}