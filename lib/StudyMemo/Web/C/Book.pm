package StudyMemo::Web::C::Book;

use WebService::Rakuten::API;
use Data::Dumper;
use Encode;
use JSON;

my $rakuten = WebService::Rakuten::API->new(
   appid => '1094713744828153190'
);

sub search{
 my($class,$c) = @_;
 my @books  = $c->db->get_search_book;
 return $c->render('book_search.tx',{books => \@books});
}

sub postsearch{
 my($class,$c) = @_;
 $c->db->delete_all_data();
 my $param = $c->req->parameters;
 my $keyword = $param->{keyword};
 my $items = $rakuten->books({keyword => $keyword,format => 'json'});
 my $books = [];
 for my $item(@{JSON::decode_json($items->content)->{Items}}){
     my $book = {};
     $book->{url} = $item->{Item}->{smallImageUrl};
     $book->{title} = $item->{Item}->{title};
     $book->{artistname} => $item->{Item}->{artistname};
     push @$books,$book;
     $c->db->insert_item($item->{Item}->{smallImageUrl},$item->{Item}->{title},$item->{Item}->{artistname});
 }
 #$c->session->set('books' => $books);
 return $c->redirect('/book/search');
}

sub list{
 my($class,$c) = @_;
 #学習本リストを取得
 return $c->render('book_list.tx');
}

sub jsbook{
 my($class,$c) = @_;
 my $param = $c->req->parameters; 
 #my $book = $c->db->search_book($param->{id}); 
 #$c->db->insert_booklist($book);
 return $c->render_json({bookid => $param->{id}});
}


1;
