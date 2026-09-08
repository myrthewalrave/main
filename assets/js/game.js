// Clicker Game Logic

let clicks = 0;
let manualClicks = 0;
let startTime = Date.now();
let autoClickerCount = 0;
let rebirthMultiplier = 1; // Bonus multiplier from rebirth

const clickButton = document.getElementById('clickButton');
const clickCountDisplay = document.getElementById('clickCount');
const cpsDisplay = document.getElementById('cps');
const resetBtn = document.getElementById('resetBtn');
const shopContainer = document.getElementById('shopContainer');
const upgradesContainer = document.getElementById('upgradesContainer');

// Inflation factor for auto-clicker costs (1.15 = 15% increase per owned)
const inflationFactor = 1.15;

// Calculate adjusted cost based on owned count
function getAdjustedCost(item) {
    return Math.floor(item.cost * Math.pow(inflationFactor, item.owned));
}

//Shop upgrades configuration
const upgrades = [
    {
        id: 'upgrade1',
        name: 'Double Click',
        cost: 50,
        description: 'Double your manual clicks',
        multiplier: 2,
        owned: false
    },
    {
        id: 'upgrade2',
        name: 'Better Auto Clickers',
        cost: 200,
        description: 'Auto clickers +50% output',
        multiplier: 1.5,
        owned: false
    },
    {
        id: 'upgrade3',
        name: 'Quadruple Click',
        cost: 1000,
        description: 'Quadruple your manual clicks',
        multiplier: 4,
        owned: false
    },
    {
        id: 'upgrade4',
        name: 'Ultimate Auto Clickers',
        cost: 5000,
        description: 'Auto clickers x2 output',
        multiplier: 2,
        owned: false

    },
    {
        id: 'upgrade5',
        name: 'Rebirth',
        cost: 20000,
        description: 'Reset your progress for a bonus',
        owned: false
    }
];

// Shop items configuration
const shopItems = [
    {
        id: 'autoClicker1',
        name: 'Fist Bumper',
        cost: 15,
        clicksPerSecond: 0.1,
        image: 'images/Fist_Bumper.png',
        owned: 0
    },
    {
        id: 'autoClicker2',
        name: 'Head Bumper',
        cost: 100,
        clicksPerSecond: 1,
        image: 'images/Head_Bumper.png',
        owned: 0
    },
    {
        id: 'autoClicker3',
        name: 'Head Scratcher',
        cost: 1000,
        clicksPerSecond: 5,
        image: 'images/Head_Scratches.png',
        owned: 0
    },
    {
        id: 'autoClicker4',
        name: 'Neck Scratcher',
        cost: 6000,
        clicksPerSecond: 25,
        image: 'images/Neck_scratcher.png',
        owned: 0
    }
];

// Initialize shop
function initializeShop() {
    initializeUpgrades();
    shopItems.forEach(item => {
        const shopItem = document.createElement('div');
        shopItem.className = 'shop-item';
        shopItem.id = item.id;
        shopItem.style.cursor = 'pointer';
        const adjustedCost = getAdjustedCost(item);
        shopItem.innerHTML = `
            <img src="${item.image}" alt="${item.name}">
            <h3 style="margin: 0 0 8px 0;">${item.name}</h3>
            <div class="price">Cost: <span class="cost-display">${adjustedCost}</span></div>
            <p>Owned: <strong class="owned-count">${item.owned}</strong></p>
            <p>+${item.clicksPerSecond}/sec</p>
        `;
        shopItem.addEventListener('click', () => buyItem(item.id));
        shopContainer.appendChild(shopItem);
    });
}

// Initialize upgrades
function initializeUpgrades() {
    upgrades.forEach(upgrade => {
        const upgradeItem = document.createElement('div');
        upgradeItem.className = 'upgrade-item';
        upgradeItem.id = upgrade.id;
        upgradeItem.style.cursor = upgrade.owned ? 'default' : 'pointer';
        upgradeItem.innerHTML = `
            <h3 style="margin: 0 0 8px 0;">${upgrade.name}</h3>
            <p style="font-size: 12px; margin: 4px 0;">${upgrade.description}</p>
            <p>Cost: <strong>${upgrade.cost}</strong></p>
            <p style="font-size: 12px; margin: 4px 0; color: #667eea;">
                ${upgrade.owned ? '✓ Owned' : 'Click to buy'}
            </p>
        `;
        if (!upgrade.owned) {
            upgradeItem.addEventListener('click', () => buyUpgrade(upgrade.id));
        }
        upgradesContainer.appendChild(upgradeItem);
    });
}

// Buy item function
function buyItem(itemId) {
    const item = shopItems.find(i => i.id === itemId);
    const adjustedCost = getAdjustedCost(item);
    if (item && clicks >= adjustedCost) {
        clicks -= adjustedCost;
        clickCountDisplay.textContent = clicks.toFixed(1);
        const autoClickerMultiplier = getAutoClickerMultiplier();
        autoClickerCount += item.clicksPerSecond * autoClickerMultiplier;
        item.owned++;
        updateOwnedDisplay(itemId);
        updateShopButtons();
        updateCPS();
    }
}

// Buy upgrade function
function buyUpgrade(upgradeId) {
    const upgrade = upgrades.find(u => u.id === upgradeId);
    if (upgrade && !upgrade.owned && clicks >= upgrade.cost) {
        clicks -= upgrade.cost;
        clickCountDisplay.textContent = clicks.toFixed(1);
        upgrade.owned = true;
        
        // Apply upgrade effects
        if (upgradeId === 'upgrade2') {
            // Better Auto Clickers: +50% auto-clicker output
            autoClickerCount *= upgrade.multiplier;
            updateCPS();
        } else if (upgradeId === 'upgrade4') {
            // Ultimate Auto Clickers: x2 auto-clicker output
            autoClickerCount *= upgrade.multiplier;
            updateCPS();
        } else if (upgradeId === 'upgrade5') {
            // Rebirth: Reset progress but increase multiplier by 10%
            performRebirth();
        }
        // Note: upgrade1 (Double Click) and upgrade3 (Quadruple Click) apply multiplier at click time
        
        updateUpgradeDisplay(upgradeId);
        updateShopButtons();
    }
}

// Perform rebirth - reset progress but keep multiplier bonus
function performRebirth() {
    rebirthMultiplier *= 1.1; // Increase multiplier by 10%
    alert(`Rebirth Complete! Your multiplier is now x${rebirthMultiplier.toFixed(2)}`);
    
    // Reset all progress
    clicks = 0;
    manualClicks = 0;
    autoClickerCount = 0;
    startTime = Date.now();
    
    // Reset shop items
    shopItems.forEach(item => {
        item.owned = 0;
    });
    
    // Reset upgrades except rebirth (keep rebirth as owned)
    upgrades.forEach(upgrade => {
        if (upgrade.id !== 'upgrade5') {
            upgrade.owned = false;
        }
    });
    
    // Update displays
    clickCountDisplay.textContent = '0';
    cpsDisplay.textContent = '0';
    upgradesContainer.innerHTML = '';
    shopContainer.innerHTML = '';
    initializeShop();
    updateShopButtons();
}

// Update owned counter display
function updateOwnedDisplay(itemId) {
    const shopItem = document.getElementById(itemId);
    const ownedDisplay = shopItem.querySelector('.owned-count');
    const costDisplay = shopItem.querySelector('.cost-display');
    const item = shopItems.find(i => i.id === itemId);
    ownedDisplay.textContent = item.owned;
    costDisplay.textContent = getAdjustedCost(item);
}

// Update upgrade display
function updateUpgradeDisplay(upgradeId) {
    const upgradeItem = document.getElementById(upgradeId);
    const costP = upgradeItem.querySelector('p:last-of-type');
    costP.textContent = '✓ Owned';
    costP.style.color = '#667eea';
    upgradeItem.classList.add('owned');
    upgradeItem.style.cursor = 'default';
}

// Auto-clicker function - adds clicks automatically
function autoClick() {
    if (autoClickerCount > 0) {
        clicks += autoClickerCount;
        clickCountDisplay.textContent = clicks.toFixed(1);
        updateCPS();
        updateShopButtons();
    }
}

// Calculate click multiplier from upgrades
function getClickMultiplier() {
    let multiplier = rebirthMultiplier;
    upgrades.forEach(upgrade => {
        if (upgrade.owned && (upgrade.id === 'upgrade1' || upgrade.id === 'upgrade3')) {
            multiplier *= upgrade.multiplier;
        }
    });
    return multiplier;
}

// Calculate auto-clicker multiplier from upgrades
function getAutoClickerMultiplier() {
    let multiplier = rebirthMultiplier;
    upgrades.forEach(upgrade => {
        if (upgrade.owned && (upgrade.id === 'upgrade2' || upgrade.id === 'upgrade4')) {
            multiplier *= upgrade.multiplier;
        }
    });
    return multiplier;
}
function updateShopButtons() {
    shopItems.forEach(item => {
        const btn = document.getElementById(item.id);
        const adjustedCost = getAdjustedCost(item);
        if (clicks >= adjustedCost) {
            btn.classList.add('affordable');
        } else {
            btn.classList.remove('affordable');
        }
    });
    upgrades.forEach(upgrade => {
        const btn = document.getElementById(upgrade.id);
        if (!upgrade.owned && clicks >= upgrade.cost) {
            btn.classList.add('affordable');
        } else if (!upgrade.owned) {
            btn.classList.remove('affordable');
        }
    });
}

// Click handler
clickButton.addEventListener('click', function() {
    const clickMultiplier = getClickMultiplier();
    clicks += clickMultiplier;
    manualClicks += clickMultiplier;
    clickCountDisplay.textContent = clicks.toFixed(1);
    updateCPS();
    updateShopButtons();
    
    //Button press animation
    clickButton.style.transform = 'scale(0.9)';
    setTimeout(() => {
        clickButton.style.transform = 'scale(1)';
    }, 50);
});

// Calculate clicks per second
function updateCPS() {
    const totalCPS = (autoClickerCount).toFixed(1);
    cpsDisplay.textContent = totalCPS;
}

// Reset game
resetBtn.addEventListener('click', function() {
    clicks = 0;
    manualClicks = 0;
    autoClickerCount = 0;
    rebirthMultiplier = 1;
    startTime = Date.now();
    shopItems.forEach(item => {
        item.owned = 0;
    });
    upgrades.forEach(upgrade => {
        upgrade.owned = false;
    });
    clickCountDisplay.textContent = '0';
    cpsDisplay.textContent = '0';
    upgradesContainer.innerHTML = '';
    shopContainer.innerHTML = '';
    initializeShop();
    updateShopButtons();
});

// Update CPS display every second
setInterval(updateCPS, 1000);

// Auto-click every 100ms (10 clicks per second max per auto-clicker)
setInterval(autoClick, 1000);

// Initialize shop on page load
initializeShop();
updateShopButtons();