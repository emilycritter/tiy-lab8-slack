var PostDetails = React.createClass({

  render() {
    var post = this.props.post;

    return <div className="post">
      <div className="photo_thumbnail">
        <div className="thumbnail">
          <img src="{post.user_photo}" alt="" />
        </div>
      </div>
      <div className="post_details">
        <div className="user">
          {post.user_name}
        </div>
      </div>

    </div>;
  }
});
