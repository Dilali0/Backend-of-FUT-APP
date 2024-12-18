const API_URL = "http://localhost/project/api/users.php";

// Fetch and display users
async function fetchUsers() {
    const response = await fetch(API_URL);
    const users = await response.json();

    const userList = document.getElementById("user-list");
    userList.innerHTML = "";

    users.forEach(user => {
        const li = document.createElement("li");
        li.textContent = `${user.name} (${user.email})`;
        li.innerHTML += `
            <button onclick="deleteUser(${user.id})">Delete</button>
            <button onclick="updateUser(${user.id}, '${user.name}', '${user.email}')">Edit</button>
        `;
        userList.appendChild(li);
    });
}

// Add a new user
document.getElementById("add-user-form").addEventListener("submit", async (e) => {
    e.preventDefault();
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;

    await fetch(API_URL, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email })
    });

    fetchUsers(); // Refresh the user list
});

// Delete a user
async function deleteUser(id) {
    await fetch(API_URL, {
        method: "DELETE",
        body: `id=${id}`,
        headers: { "Content-Type": "application/x-www-form-urlencoded" }
    });

    fetchUsers(); // Refresh the user list
}

// Update a user (Prompt-based)
async function updateUser(id, currentName, currentEmail) {
    const name = prompt("Enter new name:", currentName);
    const email = prompt("Enter new email:", currentEmail);

    if (name && email) {
        await fetch(API_URL, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ id, name, email })
        });

        fetchUsers(); // Refresh the user list
    }
}

// Load users on page load
fetchUsers();
