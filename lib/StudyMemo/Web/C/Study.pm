package StudyMemo::Web::C::Study;
use Data::Dumper;
use Encode;

sub log{
 my($class,$c,$param) = @_;
 my $user_id = $c->session->get('userid');
 my $book_list = $c->db->get_booklist_by_userid_and_id($user_id,$param->{id}); 
 return $c->render('study_log.tx',{studybook => $book_list});
}

sub record{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $param->remove('XSRF-TOKEN');
 $param->add('user_id' => $c->session->get('userid'));
 $c->db->insert_log($param);
 return $c->redirect('/book/list');
}

sub graph{
 my($class,$c) = @_; 
 return $c->render('study_graph.tx');
}

sub graph_month{
 my($class,$c) = @_;
 return $c->render_json({bookname => Encode::decode_utf8("難問系統"),jan => 14,feb => 15,mar => 35,apr => 36,may => 55,jun => 65,july => 80,aug => 89,sept=> 44,oct => 35,nov => 56,dec => 35});
}

1;
