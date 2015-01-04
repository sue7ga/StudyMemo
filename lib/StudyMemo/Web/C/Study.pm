package StudyMemo::Web::C::Study;
use Data::Dumper;

sub log{
 my($class,$c,$param) = @_;
 my $user_id = $c->session->get('userid');
 my $book_list = $c->db->get_booklist_by_userid_and_id($user_id,$param->{id}); 
 return $c->render('study_log.tx',{studybook => $book_list});
}

sub record{
 my($class,$c) = @_;
 print Dumper $c->req->parameters;
 return $c->redirect('/study/log');
}

1;
