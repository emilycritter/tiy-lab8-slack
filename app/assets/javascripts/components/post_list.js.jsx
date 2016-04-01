var PostList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      room: '',
      addPostCount: 1,
      posts: []
    }
  },

  componentDidMount(){
    var component = this;
    component.fetchPosts();
    this.autoUpdatingInterval = setInterval(function(){
      component.fetchPosts()
    }, 3000);
  },

  componentDidUpdate(){
    // console.log("componentDidUpdate");
  },

  componentWillUpdate(){
    // console.log("componentWillUpdate");
  },

  componentWillUnmount(){
    clearInterval(this.autoUpdatingInterval);
  },

  fetchPosts(){
    var component = this;
    var pathArray = window.location.pathname.split( '/' );
    var lastParameter = pathArray.pop();
    var url = "/api/rooms/"+lastParameter;
    console.log("the url to fetch is: " +url);
    fetch(url, {
      credentials: 'include'
    })
    .then(function(r){
      return r.json();
    })
    .then (function(json) {
      component.setState({
        room: json.room,
        posts: json.room.posts
      })
    });
  },

  loadPosts(){
    var component = this;
    this.setState({
      addPostCount: component.state.addPostCount + 1,
    });
  },

  render: function() {
    var component = this;
    if (this.state.posts.length > (this.state.addPostCount * 100)) {
      $(".get-old-posts").show();
    } else {
      $(".get-old-posts").hide();
    };
    return <div className="channel-posts">
      <div className="get-old-posts">
        <button onClick={this.loadPosts} className="btn btn-default">Get Older Posts</button>
      </div>
      {this.state.posts.slice(0, 100*this.state.addPostCount).reverse().map(function(thePost){
        return <PostDetails key={thePost.id} post={thePost} />
      })}
    </div>;
  }
});
