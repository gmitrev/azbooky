module BooksHelper

  def feeling(feel)
    case feel
    when 'liked'
      content_tag 'p', class: 'alert alert-success'  do
        'You liked the book :)'
      end
    when 'meh'
      content_tag 'p', class: 'alert alert-info'  do
        'You neither liked nor disliked the book'
      end
    when 'disliked'
      content_tag 'p', class: 'alert alert-danger'  do
        'You disliked the book :/'
      end
    end
  end

end
