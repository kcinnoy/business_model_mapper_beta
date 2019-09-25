$(() => {
    bindClickHandlers()
})
  
  //ES6 syntax 'arrow functions'
  const bindClickHandlers = () => {
    $('.user-nav_businesses').on('click', e => {
        e.preventDefault()
        console.log("hellox")
        history.pushState(null, null, "businesses")
        getBusinesses()
    })

    const getBusinesses = () => {
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

   
    function Business(business) {
        this.id = business.id
        this.name =  business.name
        this.description = business.description
        this.user = business.user
    }

    //prototype and ES6 syntax 'backticks'
    Business.prototype.formatIndex = function(){
      let businessProtoHtml = 
          `
            <ul>
              <li>
                <a href="/businesses/${this.id}" data-id="${this.id}" class="show_business">${this.name}</a> - <a href="/businesses${this.id}/edit" data-id="${this.id}">Edit</a>  
              </li>
            </ul>
          `
    return businessProtoHtml
    }
      
  
    Business.prototype.formatShow = function(){
      let businessShowHtml = `
        <section class="map-container">
          <div class="costs-container"> 
            <div class="costs-container__header">
              Commited spend
            </div>
            <div class="costs-container__body">
              
            </div>
          </div>
          <div class="tree"> 
            <ul>
              <li class="map-body">
                <div class="business-box">
                  <div class="business-box__head">
                    <div class="business-box__head__content">
                      ${this.name}
                    </div>
                  </div>
                  <div class="business-box__description">
                    ${this.description ? this.description: "TBC" }
                  </div>
                </div>
              </li>
            </ul>
        </section>
      `
      return businessShowHtml
    }

    $(document).on('click', ".show_business", function(e) {
      e.preventDefault()
      $('.map').empty()
      let id = $(this).attr('data-id')
      fetch(`/businesses/${id}.json`)
      .then(res => res.json())
      .then(businessObj => {

        let newBusinessObj = new Business(businessObj)
        let businessShowHtml = newBusinessObj.formatShow()
        console.log(businessShowHtml)
  
        $('.map').append(businessShowHtml)
      })
    })
  
    $(document).on('click', 'next-business', function() {
      let id = $(this).attr('data-id')
      fetch(`businesses/${id}/next`)
  
    })

    $('#new_business').on('submit', function(e) {
      e.preventDefault()
      
      const values = $(this).serialize()

      $.post("/businesses", values).done(function(data) {
        $('.map').empty()
        const newBusiness = new Business(data)
        const newBusinessHtml = newBusiness.formatShow()

        $('.map').append(newBusinessHtml)
      })
    })

    $('#sort-btn').on('click', e => {
      console.log('i work')
      fetch(`/businesses.json`)
      .then(response => response.json())
      .then(businesses => {
        // console.log(`i am the biz ${businesses}`)
      })  
    })
  
  }
  
  


  
