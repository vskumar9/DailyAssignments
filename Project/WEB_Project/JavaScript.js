// Form validation and task handling
document.addEventListener('DOMContentLoaded', function() {


    // Function to display the current date and time
function updateDateTime() {
    const now = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit' };
    document.getElementById('dateTimeDisplay').textContent = now.toLocaleDateString('en-US', options);
}
setInterval(updateDateTime, 1000);
updateDateTime(); 


const showNavbar = (toggleId, navId, bodyId, headerId) =>{
    const toggle = document.getElementById(toggleId),
    nav = document.getElementById(navId),
    bodypd = document.getElementById(bodyId),
    headerpd = document.getElementById(headerId)
        
        // Validate that all variables exist
    if(toggle && nav && bodypd && headerpd){
        toggle.addEventListener('click', ()=>{
        nav.classList.toggle('show')
        toggle.classList.toggle('bx-x')
        bodypd.classList.toggle('body-pd')
        headerpd.classList.toggle('body-pd')
        })
    }
}
        
    showNavbar('header-toggle','nav-bar','body-pd','header')
    
    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link')
    
    function colorLink(){
    if(linkColor){
        linkColor.forEach(l=> l.classList.remove('active'))
        this.classList.add('active')
    }}
    
    linkColor.forEach(l=> l.addEventListener('click', colorLink))

    const taskList = document.getElementById('taskList');
    
    const sortTaskButton = document.getElementById('sortTask');
    const sortPriorityButton = document.getElementById('sortPriority');
    const filterInput = document.getElementById('filterInput');

    const userForm = document.getElementById('userForm');
    const nameInput = document.getElementById('name');
    const cityInput = document.getElementById('city');


    const taskForm = document.getElementById('taskForm');
    const taskNameInput = document.getElementById('taskName');
    const userNameInput = document.getElementById('userName');
    const prioritySelect = document.getElementById('priority');

    const userNamesDatalist = document.getElementById('userNames');



    // Initialize tasks array
    const tasks = [];
    const users = [];

// Handle userFrom submit event 
    userForm.addEventListener('submit', function(event) {
        event.preventDefault();
        
        // Get user input values
        const name = nameInput.value.trim();
        const city = cityInput.value.trim();
        // Validate input fields
        if (name && city) {
            users.push({ name, city });
            nameInput.value = '';
            cityInput.value = '';
            console.log(`Added new user: ${name}, ${city}`);

            confirm(`Added new user: ${name}`) === true ? renderUsers(users) : console.log("Not added");
        } else {
            // Handle invalid inputs
            console.error('Please enter valid name and city.');
        }
    });
    
// Handle taskFrom submit event
    taskForm.addEventListener('submit', function(event) {
        event.preventDefault();
        
        const taskName = taskNameInput.value.trim();
        const userName = userNameInput.value.trim();
        const priority = prioritySelect.value;
    
        console.log(`Task: ${taskName}, User: ${userName}, Priority: ${priority}`);
        
        if (taskName && userName && priority) {
            tasks.push({ name: taskName, user: userName, priority: priority });
            taskNameInput.value = '';
            userNameInput.value = '';
            prioritySelect.value = '';
    
            confirm(`Added new task ${taskName}`) === true ? renderTasks(tasks) : console.log('Not added');
        } else {
            // Handle invalid inputs
            console.error('Please enter valid task details.');
        }
    });
    



    function renderTasks(tasksToRender) {
        taskList.innerHTML = ''; // Clear existing tasks
        
        tasksToRender.forEach(task => {
            // Determine class based on task priority
            const priorityClass = task.priority === 'P1' ? 'priority-high' :
                                  (task.priority === 'P2' || task.priority === 'P3') ? 'priority-medium' :
                                  'priority-low';
    
            const row = document.createElement('tr');
            row.classList.add(priorityClass);
            row.innerHTML = `
                <td>${task.name} (${task.user})</td>
                <td>${task.priority}</td>
            `;
            taskList.appendChild(row);
        });
    }
    

    function renderUsers(userToRender) {
        userNamesDatalist.innerHTML = '';
        userToRender.forEach(user => {
            const opt = document.createElement('option');
            opt.value = `${user.name} from ${user.city}`;
            opt.innerHTML = `${user.name} from ${user.city}`;
            userNamesDatalist.appendChild(opt);
            console.log(opt);
        });
    }
    

    
    function sortTasksByPriority() {
        const priorityOrder = { 'P1': 1, 'P2': 2, 'P3': 3, 'P4': 4 };
        tasks.sort((a, b) => priorityOrder[a.priority] - priorityOrder[b.priority]);
        renderTasks(tasks);
    }
    
    function sortTasksByTask() {
        tasks.sort((a, b) => a.name.localeCompare(b.name));
        renderTasks(tasks);
    }
    

    function filterTasks() {
        const filterText = filterInput.value.toLowerCase();
        const filteredTasks = tasks.filter(task =>
            task.name.toLowerCase().includes(filterText) ||
            task.user.toLowerCase().includes(filterText) ||
            task.priority.toLowerCase().includes(filterText)
        );
        renderTasks(filteredTasks);
    }

    sortTaskButton.addEventListener('click', sortTasksByTask);
    sortPriorityButton.addEventListener('click', sortTasksByPriority);
    filterInput.addEventListener('input', filterTasks);

    // Initial rendering
    renderTasks(tasks);
    renderUsers(users);
});

