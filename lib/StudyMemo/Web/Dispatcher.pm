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

post '/user/login' => "User#postuserlogin";

get '/mypage' => "User#mypage";

#Book
get '/book/search' => "Book#search";

post '/book/search' => "Book#postsearch";

get '/book/list' => "Book#list";

get '/js/book' => "Book#jsbook";

#Study
get '/study/log/:id' => "Study#log";

post '/study/record' => "Study#record";

get '/study/graph' => "Study#graph";

get '/study/graph/month' => "Study#graph_month";

get '/study/log/see/:id' => "Study#graph_see";

1;
