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
    // this.autoUpdatingInterval = setInterval(function(){
    //   component.fetchPosts()
    // }, 3000)
  },

  componentWillUnMount(){
    clearInterval(this.autoUpdatingInterval)
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
      console.log(json.room);
      console.log(json.room.posts);
      component.setState({
        room: json.room,
        posts: json.room.posts
      })
      console.log(component.state.posts);
    })
  },

  render: function() {
    return <div>
      {this.state.posts.map(function(thePost){
        return <PostDetails key={thePost.id} post={thePost} />
      })}
    </div>;
  }
});
