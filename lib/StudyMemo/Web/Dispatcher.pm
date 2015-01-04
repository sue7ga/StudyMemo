package StudyMemo::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

use Module::Find;

useall 'StudyMemo::Web::C';
base 'StudyMemo::Web::C';

any '/' => sub {
    my ($c) = @_;
    my $counter = $c->session->get('counter') || 0;
    $counter++;
    $c->session->set('counter' => $counter);
    return $c->render('index.tx', {
        counter => $counter,
    });
};

#User
get '/user/register' => "User#register";

post '/user/register' => "User#postregister";

get '/user/login' => "User#login";

#Book
get '/book/search' => "Book#search";

post '/book/search' => "Book#postsearch";

get '/book/list' => "Book#list";

#Study
get '/study/log' => "Study#log";

1;
