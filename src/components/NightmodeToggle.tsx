export function NightmodeToggle() {
    const toggleDarkMode = () => {
        const isDark = document.documentElement.classList.toggle("dark");
        try {
            localStorage.setItem("theme", isDark ? "dark" : "light");
        } catch {
            console.warn("unable to set localstorage: nightmode preference not stored");
        }
    };

    const sun = (
        <svg className="sun-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="32" height="32">
            <circle cx="50" cy="50" r="24" fill="currentColor"/>
            <g stroke="currentColor" strokeWidth="8" strokeLinecap="round">
                <line x1="50" y1="6" x2="50" y2="20"/>
                <line x1="50" y1="80" x2="50" y2="94"/>
                <line x1="6" y1="50" x2="20" y2="50"/>
                <line x1="80" y1="50" x2="94" y2="50"/>
                <line x1="18" y1="18" x2="28" y2="28"/>
                <line x1="72" y1="72" x2="82" y2="82"/>
                <line x1="18" y1="82" x2="28" y2="72"/>
                <line x1="72" y1="28" x2="82" y2="18"/>
            </g>
        </svg>
    );

    const moon = (
        <svg className="moon-icon" xmlns="http://www.w3.org/2000/svg" viewBox="25 8 65 85" width="32" height="32">
            <path
                d="M68 12
       C43 18 30 40 36 61
       C42 82 63 91 84 80
       C67 80 52 69 48 52
       C43 34 51 19 68 12Z"
                fill="currentColor"/>
        </svg>
    );

    return (
        <button
            type="button"
            aria-label="Toggle night mode"
            onClick={toggleDarkMode}
            style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                padding: '1em 0.5em',
                background: 'none',
                border: 'none',
                borderBottom: '4px solid transparent',
                cursor: 'pointer',
                color: 'inherit',
            }}
        >
            {sun}
            {moon}
        </button>
    );
}