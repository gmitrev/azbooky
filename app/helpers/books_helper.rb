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

  def prediction(index)
    index = index.round(3)
    case
    when index > 0.01
      content_tag 'span', style: 'color: #2ECC40' do
        index.to_s
      end
    when index < -0.01
      content_tag 'span', style: 'color: #FF4136' do
        index.to_s
      end
    else
      content_tag 'span', style: 'color: #7FDBFF' do
        index.to_s
      end
    end
  end

end
