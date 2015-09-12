window.ProjectsMembersView = ->
  $ ->
    $(".add-member").select2
      placeholder: "增加成员"

    $(".add-member").bind 'change', ->
      projectId = $(this).data "project-id"
      $.ajax
        url: "/projects/#{projectId}/add_member.js"
        type: "POST"
        data: { "user_id": this.value }
        success: () ->
          location.reload()

window.ProjectsShowView = ->
  $ ->
    $('[data-toggle="popover"]').popover()

    $("#add-todo-form").hide()

    $("#add-todo").click ->
      $("#add-todo-form").show()

    $("#new_todo .cancel").click ->
      $("#add-todo-form").hide()

    $("input[name=todo_done]").bind 'change', ->
      todoId = $(this).closest('li').data("todo-id")
      projectId = $(this).closest('ul').data("project-id")
      if this.checked
        $.ajax
          url: "/projects/#{projectId}/todos/#{todoId}/finish.js"
          type: 'POST'
          data: { "finished": this.checked }
          success: (data) ->
            location.reload()

    $(".todo-assign-due").popover
      html: true
      title: ->
        return $(this).closest('.todo').find(".popover-head").html()
      content: ->
        return $(this).closest('.todo').find(".popover-content").html()

    $(".todo-assign-due").bind "shown.bs.popover", ->
      $(".assignee").select2
        placeholder: "输入成员姓名"
        allowClear: true
