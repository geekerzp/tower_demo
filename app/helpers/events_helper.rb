# coding: utf-8
module EventsHelper
  def render_event(event)
    send("render_#{event.type.underscore}", event)
  end

  def render_create_todo_event(event)
    content_tag :p do
      content_tag(:small, event.created_at) + " " +
        content_tag(:strong, event.user.username) + " " +
        content_tag(:span, "创建了任务： ") + " " +
        content_tag(:span, event.todo_name) + " " +
        content_tag(:span, event.project.name, class: "label label-primary")
    end
  end

  def render_destroy_todo_event(event)
    content_tag :p do
      content_tag(:small, event.created_at) + " " +
        content_tag(:strong, event.user.username) + " " +
        content_tag(:span, "删除了任务： ") + " " +
        content_tag(:span, event.todo_name) + " " +
        content_tag(:span, event.project.name, class: "label label-primary")
    end
  end

  def render_finish_todo_event(event)
    content_tag :p do
      content_tag(:small, event.created_at) + " " +
        content_tag(:strong, event.user.username) + " " +
        content_tag(:span, "完成了任务： ") + " " +
        content_tag(:span, event.todo_name) + " " +
        content_tag(:span, event.project.name, class: "label label-primary")
    end
  end

  def render_assign_todo_event(event)
    if event.after_assignee_username.nil?
      content_tag :p do
        content_tag(:small, event.created_at) + " " +
          content_tag(:strong, event.user.username) + " " +
          content_tag(:span, "取消了") + " " +
          content_tag(:span, event.before_assignee_username) + " " +
          content_tag(:span, "的任务：") + " " +
          content_tag(:span, event.todo_name) + " " +
          content_tag(:span, event.project.name, class: "label label-primary")
      end
    else
      content_tag :p do
        content_tag(:small, event.created_at) + " " +
          content_tag(:strong, event.user.username) + " " +
          content_tag(:span, "给") + " " +
          content_tag(:span, event.after_assignee_username) + " " +
          content_tag(:span, "指派了任务：") + " " +
          content_tag(:span, event.todo_name) + " " +
          content_tag(:span, event.project.name, class: "label label-primary")
      end
    end
  end

  def render_change_todo_due_date_event(event)
    content_tag :p do
      content_tag(:small, event.created_at) + " " +
        content_tag(:strong, event.user.username) + " " +
        content_tag(:span, "将任务完成时间从") + " " +
        content_tag(:span, event.before_due_date) + " " +
        content_tag(:span, '修改为') + " " +
        content_tag(:span, event.after_due_date) + " " +
        content_tag(:span, ': ') + ' ' +
        content_tag(:span, event.todo_name) + " " +
        content_tag(:span, event.project.name, class: "label label-primary")
    end
  end

  def render_create_comment_event(event)
    content_tag :p do
      content_tag(:small, event.created_at) + " " +
        content_tag(:strong, event.user.username) + " " +
        content_tag(:span, "回复了任务：") + " " +
        content_tag(:span, event.todo_name) + " " +
        content_tag(:span, event.project.name, class: "label label-primary") +
        content_tag(:div, event.comment_content, class: 'well well-sm')
    end
  end
end
