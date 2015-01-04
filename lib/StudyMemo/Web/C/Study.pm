package StudyMemo::Web::C::Study;

sub log{
 my($class,$c) = @_;
 #本棚の書籍名を取得する
 #my @book_list = $c->db->search_booklist($user_id);
 return $c->render('study_log.tx');
}

1;
