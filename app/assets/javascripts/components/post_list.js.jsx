var PostList = React.createClass({

  autoUpdatingInterval: null,

  getInitialState(){
    return {
      room: '',
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
    fetch(url)
    .then(function(r){
      return r.json();
    })
    .then (function(json) {
      component.setState({
        room: json.room,
        posts: json.room.posts
      })
    });
    console.log(window.location.pathname);
  },

  render: function() {
    return <div className="channel-posts">
      <button>Get Older Posts</button>
      {this.state.posts.slice(0, 100).reverse().map(function(thePost){
        return <PostDetails key={thePost.id} post={thePost} />
      })}
    </div>;
  }
});
