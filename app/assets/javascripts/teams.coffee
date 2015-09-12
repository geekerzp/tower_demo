window.TeamsMembersView = ->
  $ ->
    $(".add-member").select2
      placeholder: "增加成员"

    $(".add-member").bind 'change', ->
      teamId = $(this).data 'team-id'
      $.ajax
        url: "/teams/#{teamId}/add_member.js"
        type: "POST"
        data: { "user_id": this.value }
        success: () ->
          location.reload()
