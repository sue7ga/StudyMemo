package StudyMemo::Web::C::User;

use strict;
use warnings;
use Data::Dumper;

sub register{
 my($class,$c) = @_;
 return $c->render('user_register.tx');
}

sub postregister{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 return $c->redirect('/user/login');
}

sub login{
 my($class,$c) = @_;
 return $c->render('user_login.tx');
}

1;
