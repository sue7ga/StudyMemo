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
 print Dumper $param;
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
 my($class,$c)   = @_;
 my $booklistid  = $c->session->get('booklistid');
 my $book_title  = $c->db->search_booklist_by_logid($booklistid);
 my $user_id     = $c->session->get('userid');
 my @logs        = $c->db->search_log($booklistid,$user_id);
 for my $log(@logs){
   print Dumper $log->date;
 }
 return $c->render_json({bookname => $book_title->title,jan => 14,feb => 15,mar => 35,apr => 36,may => 55,jun => 65,july => 80,aug => 89,sept=> 44,oct => 35,nov => 56,dec => 35});
}

sub graph_see{
 my($class,$c,$args) = @_;
 $c->session->set('booklistid' => $args->{id});
 return $c->render('study_graph.tx');
}

1;
