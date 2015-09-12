class EventNotifier

  def todo_creation_successful(todo)
    user = todo.creator
    project = todo.project
    CreateTodoEvent.create(user: user,
                           todo_name: todo.name,
                           project: project,
                           team: project.team)
  end

  def todo_destruction_successful(todo)
    user = todo.creator
    project = todo.project
    DestroyTodoEvent.create(user: user,
                            todo_name: todo.name,
                            project: project,
                            team: project.team)
  end

  def todo_finish_successful(todo)
    user = todo.creator
    project = todo.project
    FinishTodoEvent.create(user: user,
                           todo_name: todo.name,
                           project: project,
                           team: project.team)
  end

  def todo_assignment_successful(todo, before_assignee_id, after_assignee_id)
    before_assignee = User.find_by_id(before_assignee_id)
    after_assignee = User.find_by_id(after_assignee_id)
    user = todo.creator
    project = todo.project
    AssignTodoEvent.create(user: user,
                           todo_name: todo.name,
                           before_assignee_username: before_assignee.try(:username),
                           after_assignee_username: after_assignee.try(:username),
                           project: project,
                           team: project.team)
  end

  def todo_due_date_change_successful(todo, before_due_date, after_due_date)
    user = todo.creator
    project = todo.project
    ChangeTodoDueDateEvent.create(user: user,
                                  todo_name: todo.name,
                                  before_due_date: before_due_date,
                                  after_due_date: after_due_date,
                                  project: project,
                                  team: project.team)
  end

  def comment_creation_successful(comment)
    user = comment.user
    todo = comment.todo
    project = todo.project
    CreateCommentEvent.create(user: user,
                              todo_name: todo.name,
                              comment_content: comment.content,
                              project: project,
                              team: project.team)
  end
end
