<?php
/**
 *
 */

class Notification
{
  protected $db;
  // protected $inventory=[ ];

  function __construct()
  {
    $this->db=new DB();
  }
// return all user notification
public function all($args)
{
  return DB::init()->QueryCrud("select * from notifications where use_id=? Desc",$args);
}

//add new row to notification table
public static function addNoti($msg ,$uId,$type)
{
  // $content=['msg'=>$msg,'effectedType'=>$effectedType,'effectedId',$effectedID];

      $oStmt = 'INSERT INTO notifications (text,target_user,type)
                VALUES ( ?, ?, ?)';

          return DB::init()->QueryCrud($oStmt,[$msg,$uId,$type],0);

  }

// read and unread converter
public function changeState($id,$args)
{
  $oStmt = 'update notifications set status=? WHERE id =? ';
  
    return $this->db->QueryCrud($oStmt,$args,0);
}


}

?>