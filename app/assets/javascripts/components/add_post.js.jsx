var AddPost = React.createClass({

  getInitialState(){
    return {
      errors: {},
      room: ''
    }
  },

  componentDidMount(){
    this.fetchRoom()
  },

  fetchRoom(){
    var component = this;
    var pathArray = window.location.pathname.split( '/' );
    var lastParameter = pathArray.pop();
    var url = "/api/rooms/"+lastParameter;
    fetch(url)
    .then(function(r){
      return r.json();
    })
    .then (function(json) {
      component.setState({
        room: json.room
      })
    });
  },

  handleSubmit(event){
    event.preventDefault();

    var component = this;
    var path = window.location.pathname
    var pathArray = path.split( '/' );
    var lastParameter = pathArray.pop();
    var url = "/api/rooms/"+lastParameter+"/posts";

    var params = {
      post: {
        post_content: this.refs.post_content.value
      }
    }

    fetch(url, {
      method: 'post',
      headers: {
       "Content-type": "application/json"
      },
      credentials: 'include',
      body: JSON.stringify(params)
    })
    .then(function(response){

      console.log(response)

      return response.json();

    })
    .then(function(data){
      console.log(data)

      if (data.errors){
        component.setState({
          errors: data.errors
        })
      } else {
        window.location = path
      }
    })
  },

  render: function() {
    return <div className="add-post-box">
      <form id="new_post" onSubmit={this.handleSubmit}>

      <div className="add-post-button">
        <button className="btn btn-primary">Add</button>
      </div>

      <div className="add-post-text">
        <input type="text" ref="post_content" id="post_content" placeholder="Add post" /><em>{this.state.errors.post_content}</em>
      </div>

      </form>

    </div>;
  }
});
