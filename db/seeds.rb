projects = [
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1},
	{name: 'Test Project', user_id: 1}
]

 projects.each do |p|
	Project.create(p)
 end

tasks = [
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1},
	{name: 'Test Task', project_id: 1, complete: false, due_date: '01-06-2020', user_id: 1}
]

tasks.each do |t|
	Task.create(t)
end