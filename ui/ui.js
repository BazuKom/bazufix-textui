document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("ui-root");
    const textEl = document.getElementById("ui-text");

    const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));
    const addClass = (el, cls) => el.classList.add(cls);
    const removeClass = (el, cls) => el.classList.remove(cls);

    const validPositions = ["left-center", "center", "right-center"];

    const showText = ({text, position}) => {
        position = validPositions.includes(position) ? position : "left-center";
        textEl.textContent = text || '';
        root.style.display = 'block';
        textEl.className = '';
        addClass(textEl, position);
    };

    const updateText = ({text, position}) => {
        showText({text, position});
    };

    const hideText = () => {
        root.style.display = 'none';
        textEl.className = '';
    };

    const pressedKey = () => {
        addClass(textEl, 'pressed');
    };

    window.addEventListener('message', (event) => {
        const {type, payload} = event.data;
        switch(type){
            case 'SHOW_UI': showText(payload); break;
            case 'UPDATE_UI': updateText(payload); break;
            case 'HIDE_UI': hideText(); break;
            case 'KEY_UI': pressedKey(); break;
        }
    });
});