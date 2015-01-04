package StudyMemo::Web::C::User;

use strict;
use warnings;
use Data::Dumper;
use Email::Valid;

sub register{
 my($class,$c) = @_;
 return $c->render('user_register.tx');
}

sub postregister{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 $param->remove('password_check');
 $param->remove('XSRF-TOKEN');
 $c->db->insert_user($param);
 return $c->redirect('/user/login');
}

sub login{
 my($class,$c) = @_;
 return $c->render('user_login.tx');
}

sub mypage{
 my($class,$c) = @_; 
 print Dumper $c->session->get('user');
 return $c->render('mypage.tx');
}

sub postuserlogin{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 #my $user = $c->db->get_user($param->{email});
 $c->session->set('userid' => 1);  
 return $c->redirect('/mypage');
}

1;
