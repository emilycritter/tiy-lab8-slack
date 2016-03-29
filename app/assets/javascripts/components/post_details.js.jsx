var PostDetails = React.createClass({

  render() {
    var post = this.props.post;
    // update img source when I figure out how to get photo_url to function correctly

    return <div className="post">
      <div className="photo-thumbnail">
        <div className="thumbnail">
          <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTNi6iLSB66cAEuQefmySjM10QPqcq5toq-5CFc_78ICbOTorcPd3XDQPM" />
        </div>
      </div>
      <div className="post-details">
        <div className="user">
          <p>{post.user.name} <small>{post.created_at}</small></p>
        </div>
         <div className="post-content" dangerouslySetInnerHTML={{__html: post.content_markdown}}></div>
      </div>

    </div>;
  }
});
