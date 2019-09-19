// $(() => {
//     xbindClickHandlers()
// })
  
  //ES6 syntax 'arrow functions'
//   const xbindClickHandlers = () => {
//     $('#show-project-btn').on('click', e => {
//         e.preventDefault()
//         console.log("hello")
        // history.pushState(null, null, "businesses")
        // getBusinesses()
    // })

    function Business(business) {
        this.id = business.id
        this.name =  business.name
        this.description = business.description
        this.user = business.user
    }

    //prototype and ES6 syntax 'backticks'
    Business.prototype.formatIndex = function(){
      let businessProtoHtml = `
        <ol>
          <li>
            <a href="/businesses/${this.id}" data-id="${this.id}">${this.name}</a> - <a href="/businesses${this.id}/edit" data-id="${this.id}">Edit</a>  
          </li>
        </ol>

        <div class="link-align">
          <button class="sub-btn">New Business</button>
        </div> 
      
    `  
    return businessProtoHtml
    }
      
    // $(document).on('click', ".show_link", function(e) {
    //   e.preventDefault()
    //   $('#app-container').html('')
    //   let id = $(this).attr('data-id')
    //   fetch(`/posts/${id}.json`)
    //   .then(res => res.json())
    //   .then(post => {
    //     let newPost = new Post(post)
  
    //     let postHtml = newPost.formatShow()
  
    //     $('#app-container').append(postHtml)
    //   })
    // })
  
    $(document).on('click', 'next-post', function() {
      let id = $(this).attr('data-id')
      fetch(`posts/${id}/next`)
  
    })
  
  
  const getProject = () => {
    fetch(`/businesses.json`)
      .then(response => response.json())
      .then(businesses => {
         $('#universal-content_form').empty()
         businesses.forEach(business => {
           let newBusiness = new Business(business)
  
           let businessHtml = newBusiness.formatIndex()
  
           $('#universal-content_form').append(businessHtml)
         })
      })
  }
  

  


  
