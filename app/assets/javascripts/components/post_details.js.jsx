var PostDetails = React.createClass({

  clickIt(post){
    this.deletePost(post.id);
  },

  deletePost(postId){
    var pathArray = window.location.pathname.split( '/' );
    var roomId = pathArray.pop();
    $.ajax({
      url: '/api/rooms/' + roomId + '/posts/' + postId,
      type: 'DELETE',
      credentials: 'include',
      dataType: 'json'
    })
  },

  render: function() {
    var post = this.props.post;
    var postId = post.id;
    // update img source when I figure out how to get photo_url to function correctly

    return <div className="post">
      <div className="photo-thumbnail">
        <div className="thumbnail">
          <img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTNi6iLSB66cAEuQefmySjM10QPqcq5toq-5CFc_78ICbOTorcPd3XDQPM" />
        </div>
      </div>
      <div className="post-details">
        <div className="user">
          <p>
            {post.user.name} &nbsp;&nbsp;
            <small>{post.custom_timestamp}</small>
          </p>
          <div onClick={this.clickIt.bind(this, post)} className="post-options">
            <i className="fa fa-ban"></i>
          </div>
        </div>
         <div className="post-content" dangerouslySetInnerHTML={{__html: post.content_markdown}}></div>
      </div>
    </div>;
  }
});
