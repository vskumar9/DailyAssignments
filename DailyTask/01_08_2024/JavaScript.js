function scrollToContact() {
    document.querySelector('#contact').scrollIntoView({ behavior: 'smooth' });
}

function toggleMenu() {
    const menu = document.getElementById('navMenu');
    menu.style.display = (menu.style.display === 'flex' || menu.style.display === '') ? 'none' : 'flex';
}

function closeMenu() {
    document.getElementById('navMenu').style.display = 'none';
}