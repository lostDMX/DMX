game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- تنظيف أي واجهة موجودة مسبقاً
if playerGui:FindFirstChild("InspectionSystem") then
    playerGui.InspectionSystem:Destroy()
end

-- إنشاء واجهة إدخال الرمز
local accessGui = Instance.new("ScreenGui")
accessGui.Name = "InspectionSystem"
accessGui.ResetOnSpawn = false
accessGui.Parent = playerGui

local accessFrame = Instance.new("Frame")
accessFrame.Size = UDim2.new(0.3, 0, 0.25, 0)
accessFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
accessFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
accessFrame.BorderSizePixel = 0
accessFrame.Parent = accessGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.05, 0)
uiCorner.Parent = accessFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "نظام التفتيش"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextScaled = true
titleLabel.Parent = accessFrame

local codeBox = Instance.new("TextBox")
codeBox.Size = UDim2.new(0.8, 0, 0.3, 0)
codeBox.Position = UDim2.new(0.1, 0, 0.35, 0)
codeBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
codeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
codeBox.PlaceholderText = "أدخل رمز التفتيش"
codeBox.Font = Enum.Font.Gotham
codeBox.TextScaled = true
codeBox.ClearTextOnFocus = false
codeBox.Parent = accessFrame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.5, 0, 0.25, 0)
submitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
submitButton.BackgroundColor3 = Color3.fromRGB(80, 120, 80)
submitButton.Text = "دخول"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextScaled = true
submitButton.Parent = accessFrame

local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
errorLabel.Position = UDim2.new(0.1, 0, 0.6, 0)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
errorLabel.Font = Enum.Font.Gotham
errorLabel.TextScaled = true
errorLabel.Visible = false
errorLabel.Parent = accessFrame

-- بيانات العناصر
local itemsData = {
    ["plrMoney"] = {
        ["itemTitle"] = "نقود",
        ["itemImg"] = "rbxassetid://17343358699",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrLuckyCoin"] = {
        ["itemTitle"] = "عملة حظ",
        ["itemImg"] = "rbxassetid://17516087166",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrBankMoney"] = {
        ["itemTitle"] = "فلوس البنك",
        ["itemImg"] = "rbxassetid://18867272539",
        ["canSteal"] = false,
        ["canTrade"] = false,
        ["canDestroy"] = false
    },
    ["plrGems"] = {
        ["itemTitle"] = "جواهر",
        ["itemImg"] = "rbxassetid://18867272539",
        ["canSteal"] = false,
        ["canTrade"] = false,
        ["canDestroy"] = false
    },
    ["plrMagicBall"] = {
        ["itemTitle"] = "كره سحريه",
        ["itemImg"] = "rbxassetid://116728739619537",
        ["canSteal"] = false,
        ["canTrade"] = false,
        ["canDestroy"] = false
    },
    ["plrBurger"] = {
        ["itemTitle"] = "برجر",
        ["itemImg"] = "rbxassetid://17343361492",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrWater"] = {
        ["itemTitle"] = "ماء",
        ["itemImg"] = "rbxassetid://17343364645",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrFries"] = {
        ["itemTitle"] = "بطاطس مقلية",
        ["itemImg"] = "rbxassetid://17343370272",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCola"] = {
        ["itemTitle"] = "كولا",
        ["itemImg"] = "rbxassetid://17343374225",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGraph"] = {
        ["itemTitle"] = "عنب",
        ["itemImg"] = "rbxassetid://17343376277",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGraphBox"] = {
        ["itemTitle"] = "صندوق عنب",
        ["itemImg"] = "rbxassetid://90835335166992",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGraphBottel"] = {
        ["itemTitle"] = "مشروب العنب",
        ["itemImg"] = "rbxassetid://17343378190",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrHandCuff"] = {
        ["itemTitle"] = "كلبشة",
        ["itemImg"] = "rbxassetid://17393619357",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrHandCuffKey"] = {
        ["itemTitle"] = "مفتاح",
        ["itemImg"] = "rbxassetid://17343392912",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrLockpick"] = {
        ["itemTitle"] = "فاتح اقفال",
        ["itemImg"] = "rbxassetid://17515434661",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrSniper"] = {
        ["itemTitle"] = "سنايبر",
        ["itemImg"] = "rbxassetid://17343398656",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSniperAmmo"] = {
        ["itemTitle"] = "رصاص سنايبر",
        ["itemImg"] = "rbxassetid://17343400566",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrAR3"] = {
        ["itemTitle"] = "رشاش",
        ["itemImg"] = "rbxassetid://17343411830",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrAR3Ammo"] = {
        ["itemTitle"] = "رصاص رشاش",
        ["itemImg"] = "rbxassetid://17343416711",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCrossbow"] = {
        ["itemTitle"] = "قوس",
        ["itemImg"] = "rbxassetid://17062322002",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCrossbowAmmo"] = {
        ["itemTitle"] = "سهم",
        ["itemImg"] = "rbxassetid://17062321824",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrShotgun"] = {
        ["itemTitle"] = "شدقن",
        ["itemImg"] = "rbxassetid://17343418273",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrShotgunAmmo"] = {
        ["itemTitle"] = "رصاص شدقن",
        ["itemImg"] = "rbxassetid://17343420104",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrRocketLauncher"] = {
        ["itemTitle"] = "ار بي جي",
        ["itemImg"] = "rbxassetid://17343425101",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrRocketLauncherAmmo"] = {
        ["itemTitle"] = "طلقة ار بي جي",
        ["itemImg"] = "rbxassetid://17343426184",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGrenadeLauncher"] = {
        ["itemTitle"] = "قاذف متفجرات",
        ["itemImg"] = "rbxassetid://17343428988",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGrenadeLauncherAmmo"] = {
        ["itemTitle"] = "طلقة متفجرة",
        ["itemImg"] = "rbxassetid://17364582560",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrRailgun"] = {
        ["itemTitle"] = "سنايبر كهربائي",
        ["itemImg"] = "rbxassetid://115910628549928",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPistol"] = {
        ["itemTitle"] = "مسدس",
        ["itemImg"] = "rbxassetid://17343444683",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPistolAmmo"] = {
        ["itemTitle"] = "طلقة مسدس",
        ["itemImg"] = "rbxassetid://17343441874",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSMG"] = {
        ["itemTitle"] = "اس ام جي",
        ["itemImg"] = "rbxassetid://17343446416",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSMGAmmo"] = {
        ["itemTitle"] = "طلقة اس ام جي",
        ["itemImg"] = "rbxassetid://17343447958",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCard"] = {
        ["itemTitle"] = "هوية وطنية",
        ["itemImg"] = "rbxassetid://17393616555",
        ["canSteal"] = false,
        ["canTrade"] = false,
        ["canDestroy"] = false
    },
    ["plrShield"] = {
        ["itemTitle"] = "درع",
        ["itemImg"] = "rbxassetid://82024157795263",
        ["Health"] = 300,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["RareSniper"] = {
        ["itemTitle"] = "سنايبر",
        ["itemImg"] = "rbxassetid://140158376400509",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrAK"] = {
        ["itemTitle"] = "رشاش",
        ["itemImg"] = "rbxassetid://17343411830",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["RareAK"] = {
        ["itemTitle"] = "رشاش",
        ["itemImg"] = "rbxassetid://95279468930139",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["RareShotgun"] = {
        ["itemTitle"] = "شدقن",
        ["itemImg"] = "rbxassetid://73924558988667",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["RareRocketLauncher"] = {
        ["itemTitle"] = "ار بي جي",
        ["itemImg"] = "rbxassetid://97971989432787",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["RareGrenadeLauncher"] = {
        ["itemTitle"] = "قاذف متفجرات",
        ["itemImg"] = "rbxassetid://112685212719484",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["RarePistol"] = {
        ["itemTitle"] = "مسدس",
        ["itemImg"] = "rbxassetid://73452031633341",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["RareSMG"] = {
        ["itemTitle"] = "اس ام جي",
        ["itemImg"] = "rbxassetid://118299442222764",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrAxe"] = {
        ["itemTitle"] = "فأس",
        ["itemImg"] = "rbxassetid://18587981621",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPickAxe"] = {
        ["itemTitle"] = "معول",
        ["itemImg"] = "rbxassetid://18587979445",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrHoe"] = {
        ["itemTitle"] = "مجرفة",
        ["itemImg"] = "rbxassetid://18631021308",
        ["Health"] = 100,
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrTaser"] = {
        ["itemTitle"] = "تيزر كهربائي",
        ["itemImg"] = "rbxassetid://119740812687227",
        ["Health"] = 100,
        ["canSteal"] = false,
        ["canTrade"] = false,
        ["canDestroy"] = true
    },
    ["plrMachineGun"] = {
        ["itemTitle"] = "ماشين قن",
        ["itemImg"] = "rbxassetid://80981430586460",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrHealPistol"] = {
        ["itemTitle"] = "مسدس علاج",
        ["itemImg"] = "rbxassetid://127143220992906",
        ["Health"] = 100,
        ["canSteal"] = false,
        ["canTrade"] = false,
        ["canDestroy"] = true
    },
    ["plrSentryTurret"] = {
        ["itemTitle"] = "الي دفاع صغير",
        ["itemImg"] = "rbxassetid://128918514242292",
        ["Health"] = 300,
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrLog"] = {
        ["itemTitle"] = "خشب خام",
        ["itemImg"] = "rbxassetid://18598170687",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrWoodBlank"] = {
        ["itemTitle"] = "لوح خشب",
        ["itemImg"] = "rbxassetid://18598172132",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrRawStone"] = {
        ["itemTitle"] = "حجر خام",
        ["itemImg"] = "rbxassetid://18597973867",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrStoneBrick"] = {
        ["itemTitle"] = "مكعب حجر",
        ["itemImg"] = "rbxassetid://18662095546",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCoal"] = {
        ["itemTitle"] = "فحم",
        ["itemImg"] = "rbxassetid://18598086228",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSulfur"] = {
        ["itemTitle"] = "كبريت",
        ["itemImg"] = "rbxassetid://18810114339",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSaltpeter"] = {
        ["itemTitle"] = "ملح صخري",
        ["itemImg"] = "rbxassetid://18810119537",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrIronOre"] = {
        ["itemTitle"] = "حديد خام",
        ["itemImg"] = "rbxassetid://18598165259",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrIronIngot"] = {
        ["itemTitle"] = "حديد سبيكه",
        ["itemImg"] = "rbxassetid://18636762014",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSilverOre"] = {
        ["itemTitle"] = "فضه خام",
        ["itemImg"] = "rbxassetid://134726134389975",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSilverIngot"] = {
        ["itemTitle"] = "فضه سبيكه",
        ["itemImg"] = "rbxassetid://18598108856",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGoldOre"] = {
        ["itemTitle"] = "ذهب خام",
        ["itemImg"] = "rbxassetid://131301873626589",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGoldIngot"] = {
        ["itemTitle"] = "ذهب سبيكه",
        ["itemImg"] = "rbxassetid://18598119229",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrDiamond"] = {
        ["itemTitle"] = "الماس",
        ["itemImg"] = "rbxassetid://18849936693",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCarrot"] = {
        ["itemTitle"] = "جزر",
        ["itemImg"] = "rbxassetid://18600994351",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrTomato"] = {
        ["itemTitle"] = "طماطم",
        ["itemImg"] = "rbxassetid://18601064989",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPepper"] = {
        ["itemTitle"] = "فلفل",
        ["itemImg"] = "rbxassetid://18601084855",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrCorn"] = {
        ["itemTitle"] = "ذره",
        ["itemImg"] = "rbxassetid://18601071941",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrOnion"] = {
        ["itemTitle"] = "بصل",
        ["itemImg"] = "rbxassetid://18601117802",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrMushroom"] = {
        ["itemTitle"] = "فطر",
        ["itemImg"] = "rbxassetid://18601135448",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrBlackOil"] = {
        ["itemTitle"] = "زيت اسود",
        ["itemImg"] = "rbxassetid://18660107925",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrRedOil"] = {
        ["itemTitle"] = "زيت احمر",
        ["itemImg"] = "rbxassetid://18660112069",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrYallowOil"] = {
        ["itemTitle"] = "زيت اصفر",
        ["itemImg"] = "rbxassetid://18660114577",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrHighRedOil"] = {
        ["itemTitle"] = "زيت احمر محسن",
        ["itemImg"] = "rbxassetid://18660128056",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrHighYallowOil"] = {
        ["itemTitle"] = "زيت اصفر محسن",
        ["itemImg"] = "rbxassetid://18660131360",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrElectronicKit"] = {
        ["itemTitle"] = "قطع الكترونيات",
        ["itemImg"] = "rbxassetid://18803089105",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrScrap"] = {
        ["itemTitle"] = "خرده",
        ["itemImg"] = "rbxassetid://18803099233",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrDiamondRing"] = {
        ["itemTitle"] = "خاتم الماس",
        ["itemImg"] = "rbxassetid://18803107169",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrSteel"] = {
        ["itemTitle"] = "ستييل",
        ["itemImg"] = "rbxassetid://18857938486",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrWoodStick"] = {
        ["itemTitle"] = "عصا خشبية",
        ["itemImg"] = "rbxassetid://18857997140",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPrintSMG"] = {
        ["itemTitle"] = "تصميم اس ام جي",
        ["itemImg"] = "rbxassetid://18858384233",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPrintAK"] = {
        ["itemTitle"] = "تصميم رشاش",
        ["itemImg"] = "rbxassetid://18858391175",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPrintShotgun"] = {
        ["itemTitle"] = "تصميم شدقن",
        ["itemImg"] = "rbxassetid://18858401218",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPrintSniper"] = {
        ["itemTitle"] = "تصميم سنايبر",
        ["itemImg"] = "rbxassetid://18858406369",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPrintRocket"] = {
        ["itemTitle"] = "تصميم ار بي جي",
        ["itemImg"] = "rbxassetid://18858414856",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrPrintGrenade"] = {
        ["itemTitle"] = "تصميم قاذف متفجرات",
        ["itemImg"] = "rbxassetid://18858422806",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGunpowder"] = {
        ["itemTitle"] = "بارود",
        ["itemImg"] = "rbxassetid://18858476604",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrGasCan"] = {
        ["itemTitle"] = "جالون بنزين",
        ["itemImg"] = "rbxassetid://18921160751",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrLaborPoition"] = {
        ["itemTitle"] = "مشروب الطاقة",
        ["itemImg"] = "rbxassetid://109085035997395",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrFixBox"] = {
        ["itemTitle"] = "صندوق تصليح",
        ["itemImg"] = "rbxassetid://137585160427569",
        ["canSteal"] = true,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrBlackMarketCoin"] = {
        ["itemTitle"] = "عملة الجمجمة",
        ["itemImg"] = "rbxassetid://121823972885491",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = true
    },
    ["plrDailyRest"] = {
        ["itemTitle"] = "ساعة رملية",
        ["itemImg"] = "rbxassetid://135311954967416",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrJobXpPoition"] = {
        ["itemTitle"] = "x500 نقطة وظيفة",
        ["itemImg"] = "rbxassetid://71588842281829",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrAdvancedkit"] = {
        ["itemTitle"] = "عدة تصليح احترافية",
        ["itemImg"] = "rbxassetid://84982348393848",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrGoldenKey"] = {
        ["itemTitle"] = "مفتاح ذهبي",
        ["itemImg"] = "rbxassetid://77714156279378",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrNameChangeCard"] = {
        ["itemTitle"] = "بطاقة تغير اسم",
        ["itemImg"] = "rbxassetid://133224823395444",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrGiftVip"] = {
        ["itemTitle"] = "VIP اشتراك",
        ["itemImg"] = "rbxassetid://126661086590759",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrBloodBag"] = {
        ["itemTitle"] = "كيس دم",
        ["itemImg"] = "rbxassetid://91294609087466",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrAmmoShildPack"] = {
        ["itemTitle"] = "واقي رصاص",
        ["itemImg"] = "rbxassetid://128731433131062",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrSmallGemsBox"] = {
        ["itemTitle"] = "صندوق 100 جوهرة هدية",
        ["itemImg"] = "rbxassetid://83609382523197",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrGangPotion"] = {
        ["itemTitle"] = "مشروب اكسبي للعصابة",
        ["itemImg"] = "rbxassetid://140378316640594",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrWeaponsBox"] = {
        ["itemTitle"] = "صندوق أسلحة عشوائي",
        ["itemImg"] = "rbxassetid://72371478446845",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["plrAmmoBox"] = {
        ["itemTitle"] = "صندوق رصاص عشوائي",
        ["itemImg"] = "rbxassetid://137192824730682",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["Skeleton"] = {
        ["itemTitle"] = "سكن سكيليتون",
        ["itemImg"] = "rbxassetid://96621933171742",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["Robo"] = {
        ["itemTitle"] = "سكن روبوت التجارب",
        ["itemImg"] = "rbxassetid://99356792502062",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    },
    ["Alien"] = {
        ["itemTitle"] = "سكن فضائي",
        ["itemImg"] = "rbxassetid://135288042138748",
        ["canSteal"] = false,
        ["canTrade"] = true,
        ["canDestroy"] = false
    }
}

-- وظيفة إنشاء واجهة التفتيش الرئيسية
local function createMainInspectionGui()
    accessGui:Destroy()
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PlayerDataViewer"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 10
    screenGui.Parent = playerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
    mainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    -- إضافة تأثيرات للواجهة
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0.03, 0)
    uiCorner.Parent = mainFrame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = Color3.fromRGB(80, 80, 80)
    uiStroke.Parent = mainFrame

    -- شريط العنوان
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0.08, 0)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleText = Instance.new("TextLabel")
    titleText.Name = "TitleText"
    titleText.Size = UDim2.new(0.6, 0, 0.8, 0)
    titleText.Position = UDim2.new(0.2, 0, 0.1, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "عرض بيانات اللاعب"
    titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleText.TextScaled = true
    titleText.Font = Enum.Font.GothamBold
    titleText.TextXAlignment = Enum.TextXAlignment.Center
    titleText.Parent = titleBar

    -- زر الإغلاق
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0.08, 0, 0.8, 0)
    closeButton.Position = UDim2.new(0.92, 0, 0.1, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = titleBar

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- إطار الإدخال
    local inputFrame = Instance.new("Frame")
    inputFrame.Name = "InputFrame"
    inputFrame.Size = UDim2.new(1, 0, 0.1, 0)
    inputFrame.Position = UDim2.new(0, 0, 0.08, 0)
    inputFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    inputFrame.BorderSizePixel = 0
    inputFrame.Parent = mainFrame

    local inputBox = Instance.new("TextBox")
    inputBox.Name = "PlayerIdInput"
    inputBox.Size = UDim2.new(0.4, 0, 0.6, 0)
    inputBox.Position = UDim2.new(0.3, 0, 0.2, 0)
    inputBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.PlaceholderText = "أدخل رقم البطاقة (مثال: 1001)"
    inputBox.Text = ""
    inputBox.Font = Enum.Font.Gotham
    inputBox.TextScaled = true
    inputBox.ClearTextOnFocus = false
    inputBox.Parent = inputFrame

    -- تحسينات مربع النص
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0.2, 0)
    inputCorner.Parent = inputBox

    local inputPadding = Instance.new("UIPadding")
    inputPadding.PaddingLeft = UDim.new(0.05, 0)
    inputPadding.PaddingRight = UDim.new(0.05, 0)
    inputPadding.Parent = inputBox

    -- زر البحث
    local searchButton = Instance.new("TextButton")
    searchButton.Name = "SearchButton"
    searchButton.Size = UDim2.new(0.2, 0, 0.6, 0)
    searchButton.Position = UDim2.new(0.7, 0, 0.2, 0)
    searchButton.BackgroundColor3 = Color3.fromRGB(80, 120, 80)
    searchButton.Text = "بحث"
    searchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchButton.Font = Enum.Font.GothamBold
    searchButton.TextScaled = true
    searchButton.Parent = inputFrame

    -- تحسينات زر البحث
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0.2, 0)
    searchCorner.Parent = searchButton

    -- تبويبات الواجهة
    local tabsFrame = Instance.new("Frame")
    tabsFrame.Name = "TabsFrame"
    tabsFrame.Size = UDim2.new(1, 0, 0.08, 0)
    tabsFrame.Position = UDim2.new(0, 0, 0.18, 0)
    tabsFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tabsFrame.BorderSizePixel = 0
    tabsFrame.Parent = mainFrame

    local inventoryTab = Instance.new("TextButton")
    inventoryTab.Name = "InventoryTab"
    inventoryTab.Size = UDim2.new(0.33, 0, 0.9, 0)
    inventoryTab.Position = UDim2.new(0, 0, 0.05, 0)
    inventoryTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    inventoryTab.Text = "الحقيبة"
    inventoryTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    inventoryTab.Font = Enum.Font.GothamBold
    inventoryTab.TextScaled = true
    inventoryTab.Parent = tabsFrame

    local warehouseTab = Instance.new("TextButton")
    warehouseTab.Name = "WarehouseTab"
    warehouseTab.Size = UDim2.new(0.33, 0, 0.9, 0)
    warehouseTab.Position = UDim2.new(0.34, 0, 0.05, 0)
    warehouseTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    warehouseTab.Text = "الخزنة"
    warehouseTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    warehouseTab.Font = Enum.Font.GothamBold
    warehouseTab.TextScaled = true
    warehouseTab.Parent = tabsFrame

    local infoTab = Instance.new("TextButton")
    infoTab.Name = "InfoTab"
    infoTab.Size = UDim2.new(0.33, 0, 0.9, 0)
    infoTab.Position = UDim2.new(0.68, 0, 0.05, 0)
    infoTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    infoTab.Text = "المعلومات"
    infoTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    infoTab.Font = Enum.Font.GothamBold
    infoTab.TextScaled = true
    infoTab.Parent = tabsFrame

    -- إطار المحتوى
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, 0, 0.74, 0)
    contentFrame.Position = UDim2.new(0, 0, 0.26, 0)
    contentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = mainFrame

    -- حاوية العناصر (للحقيبة)
    local inventoryContainer = Instance.new("ScrollingFrame")
    inventoryContainer.Name = "InventoryContainer"
    inventoryContainer.Size = UDim2.new(1, 0, 1, 0)
    inventoryContainer.Position = UDim2.new(0, 0, 0, 0)
    inventoryContainer.BackgroundTransparency = 1
    inventoryContainer.ScrollBarThickness = 8
    inventoryContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    inventoryContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    inventoryContainer.Visible = false
    inventoryContainer.Parent = contentFrame

    local inventoryGrid = Instance.new("UIGridLayout")
    inventoryGrid.Name = "InventoryGrid"
    inventoryGrid.CellPadding = UDim2.new(0.02, 0, 0.02, 0)
    inventoryGrid.CellSize = UDim2.new(0.18, 0, 0.18, 0)
    inventoryGrid.SortOrder = Enum.SortOrder.LayoutOrder
    inventoryGrid.Parent = inventoryContainer

    -- حاوية العناصر (للخزنة)
    local warehouseContainer = Instance.new("ScrollingFrame")
    warehouseContainer.Name = "WarehouseContainer"
    warehouseContainer.Size = UDim2.new(1, 0, 1, 0)
    warehouseContainer.Position = UDim2.new(0, 0, 0, 0)
    warehouseContainer.BackgroundTransparency = 1
    warehouseContainer.ScrollBarThickness = 8
    warehouseContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    warehouseContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    warehouseContainer.Visible = false
    warehouseContainer.Parent = contentFrame

    local warehouseGrid = Instance.new("UIGridLayout")
    warehouseGrid.Name = "WarehouseGrid"
    warehouseGrid.CellPadding = UDim2.new(0.02, 0, 0.02, 0)
    warehouseGrid.CellSize = UDim2.new(0.18, 0, 0.18, 0)
    warehouseGrid.SortOrder = Enum.SortOrder.LayoutOrder
    warehouseGrid.Parent = warehouseContainer

    -- حاوية المعلومات (لبيانات اللاعب)
    local infoContainer = Instance.new("Frame")
    infoContainer.Name = "InfoContainer"
    infoContainer.Size = UDim2.new(1, 0, 1, 0)
    infoContainer.Position = UDim2.new(0, 0, 0, 0)
    infoContainer.BackgroundTransparency = 1
    infoContainer.Visible = false
    infoContainer.Parent = contentFrame

    local infoScroll = Instance.new("ScrollingFrame")
    infoScroll.Name = "InfoScroll"
    infoScroll.Size = UDim2.new(1, 0, 1, 0)
    infoScroll.Position = UDim2.new(0, 0, 0, 0)
    infoScroll.BackgroundTransparency = 1
    infoScroll.ScrollBarThickness = 8
    infoScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    infoScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    infoScroll.Parent = infoContainer

    local playerInfoFrame = Instance.new("Frame")
    playerInfoFrame.Name = "PlayerInfoFrame"
    playerInfoFrame.Size = UDim2.new(0.9, 0, 0, 0)
    playerInfoFrame.Position = UDim2.new(0.05, 0, 0, 10)
    playerInfoFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    playerInfoFrame.AutomaticSize = Enum.AutomaticSize.Y
    playerInfoFrame.Parent = infoScroll

    local playerInfoTitle = Instance.new("TextLabel")
    playerInfoTitle.Name = "PlayerInfoTitle"
    playerInfoTitle.Size = UDim2.new(1, 0, 0.15, 0)
    playerInfoTitle.Position = UDim2.new(0, 0, 0, 0)
    playerInfoTitle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    playerInfoTitle.Text = "معلومات اللاعب"
    playerInfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    playerInfoTitle.Font = Enum.Font.GothamBold
    playerInfoTitle.TextScaled = true
    playerInfoTitle.Parent = playerInfoFrame

    local playerInfoGrid = Instance.new("UIGridLayout")
    playerInfoGrid.Name = "PlayerInfoGrid"
    playerInfoGrid.CellPadding = UDim2.new(0.02, 0, 0.02, 0)
    playerInfoGrid.CellSize = UDim2.new(0.48, 0, 0.2, 0)
    playerInfoGrid.SortOrder = Enum.SortOrder.LayoutOrder
    playerInfoGrid.Parent = playerInfoFrame

    -- متغيرات التبويبات
    local currentTab = "inventory"
    inventoryTab.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    warehouseTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    infoTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    inventoryContainer.Visible = true
    warehouseContainer.Visible = false
    infoContainer.Visible = false

    -- وظائف التبويبات
    local function switchTab(tab)
        currentTab = tab
        
        if tab == "inventory" then
            inventoryTab.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            warehouseTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            infoTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            inventoryContainer.Visible = true
            warehouseContainer.Visible = false
            infoContainer.Visible = false
        elseif tab == "warehouse" then
            inventoryTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            warehouseTab.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            infoTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            inventoryContainer.Visible = false
            warehouseContainer.Visible = true
            infoContainer.Visible = false
        elseif tab == "info" then
            inventoryTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            warehouseTab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            infoTab.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            inventoryContainer.Visible = false
            warehouseContainer.Visible = false
            infoContainer.Visible = true
        end
    end

    inventoryTab.MouseButton1Click:Connect(function()
        switchTab("inventory")
    end)

    warehouseTab.MouseButton1Click:Connect(function()
        switchTab("warehouse")
    end)

    infoTab.MouseButton1Click:Connect(function()
        switchTab("info")
    end)

    -- دالة للتحقق مما إذا كان اسم العنصر يطابق النمط الأساسي
    local function isMatchingItem(itemName, baseName)
        -- التحقق من المطابقة المباشرة أولاً
        if itemName == baseName then
            return true
        end
        
        -- التحقق من أن الاسم يبدأ بالنمط الأساسي ويتبعه أرقام
        local pattern = "^" .. baseName .. "%d+$"
        return string.match(itemName, pattern) ~= nil
    end

    -- وظيفة إنشاء عنصر واجهة
    local function createItemWidget(itemId, itemCount)
        -- لا تعرض العنصر إذا كانت الكمية أقل من 1
        if itemCount < 1 then
            return nil
        end
        
        -- البحث عن العنصر الأساسي المطابق
        local baseItemId = itemId
        local foundItemData = itemsData[itemId]
        
        -- إذا لم يتم العثور على العنصر مباشرة، نبحث عن مطابقة نمطية
        if not foundItemData then
            for key, data in pairs(itemsData) do
                if isMatchingItem(itemId, key) then
                    baseItemId = key
                    foundItemData = data
                    break
                end
            end
        end
        
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = itemId
        itemFrame.Size = UDim2.new(1, 0, 1, 0)
        itemFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        
        local itemCorner = Instance.new("UICorner")
        itemCorner.CornerRadius = UDim.new(0.1, 0)
        itemCorner.Parent = itemFrame
        
        local itemImage = Instance.new("ImageLabel")
        itemImage.Name = "ItemImage"
        itemImage.Size = UDim2.new(0.8, 0, 0.6, 0)
        itemImage.Position = UDim2.new(0.1, 0, 0.1, 0)
        itemImage.BackgroundTransparency = 1
        itemImage.Image = foundItemData and foundItemData.itemImg or "rbxassetid://0"
        itemImage.Parent = itemFrame
        
        local itemTitle = Instance.new("TextLabel")
        itemTitle.Name = "ItemTitle"
        itemTitle.Size = UDim2.new(0.9, 0, 0.2, 0)
        itemTitle.Position = UDim2.new(0.05, 0, 0.72, 0)
        itemTitle.BackgroundTransparency = 1
        itemTitle.Text = foundItemData and foundItemData.itemTitle or itemId
        itemTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemTitle.TextScaled = true
        itemTitle.Font = Enum.Font.Gotham
        itemTitle.Parent = itemFrame
        
        local itemCountText = Instance.new("TextLabel")
        itemCountText.Name = "ItemCount"
        itemCountText.Size = UDim2.new(0.3, 0, 0.2, 0)
        itemCountText.Position = UDim2.new(0.7, 0, 0.02, 0)
        itemCountText.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        itemCountText.Text = tostring(itemCount)
        itemCountText.TextColor3 = Color3.fromRGB(255, 255, 255)
        itemCountText.TextScaled = true
        itemCountText.Font = Enum.Font.GothamBold
        itemCountText.Parent = itemFrame
        
        local countCorner = Instance.new("UICorner")
        countCorner.CornerRadius = UDim.new(0.5, 0)
        countCorner.Parent = itemCountText
        
        if foundItemData and foundItemData.Health then
            local healthBar = Instance.new("Frame")
            healthBar.Name = "HealthBar"
            healthBar.Size = UDim2.new(0.8, 0, 0.05, 0)
            healthBar.Position = UDim2.new(0.1, 0, 0.92, 0)
            healthBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            healthBar.BorderSizePixel = 0
            
            local healthCorner = Instance.new("UICorner")
            healthCorner.CornerRadius = UDim.new(0.5, 0)
            healthCorner.Parent = healthBar
            
            local healthFill = Instance.new("Frame")
            healthFill.Name = "HealthFill"
            healthFill.Size = UDim2.new(foundItemData.Health / 300, 0, 1, 0)
            healthFill.Position = UDim2.new(0, 0, 0, 0)
            healthFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            healthFill.BorderSizePixel = 0
            healthFill.Parent = healthBar
            
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(0.5, 0)
            fillCorner.Parent = healthFill
            
            healthBar.Parent = itemFrame
        end
        
        return itemFrame
    end

    -- وظيفة البحث عن اللاعب بواسطة plrCardId
    local function findPlayerByCardId(cardId)
        for _, player in ipairs(Players:GetPlayers()) do
            local plrVars = player:FindFirstChild("plrVars")
            if plrVars then
                local plrCardId = plrVars:FindFirstChild("plrCardId")
                if plrCardId and tostring(plrCardId.Value) == tostring(cardId) then
                    return player
                end
            end
        end
        return nil
    end

    -- وظيفة الحصول على اسم اللاعب من plrVars.plrCardName
    local function getPlayerCardName(player)
        if player then
            local plrVars = player:FindFirstChild("plrVars")
            if plrVars then
                local plrCardName = plrVars:FindFirstChild("plrCardName")
                if plrCardName then
                    return plrCardName.Value
                end
            end
        end
        return "غير معروف"
    end

    -- وظيفة عرض بيانات اللاعب
    local function displayPlayerData(cardId)
        -- مسح العناصر السابقة
        for _, child in ipairs(inventoryContainer:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(warehouseContainer:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        
        for _, child in ipairs(playerInfoFrame:GetChildren()) do
            if child:IsA("TextLabel") and child.Name ~= "PlayerInfoTitle" then
                child:Destroy()
            end
        end
        
        -- البحث عن اللاعب بواسطة plrCardId
        local targetPlayer = findPlayerByCardId(cardId)
        
        if not targetPlayer then
            -- إذا لم يتم العثور على اللاعب
            local notFoundLabel = Instance.new("TextLabel")
            notFoundLabel.Name = "NotFoundLabel"
            notFoundLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
            notFoundLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
            notFoundLabel.BackgroundTransparency = 1
            notFoundLabel.Text = "لم يتم العثور على اللاعب!"
            notFoundLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            notFoundLabel.Font = Enum.Font.GothamBold
            notFoundLabel.TextScaled = true
            notFoundLabel.Parent = contentFrame
            
            task.delay(2, function()
                notFoundLabel:Destroy()
            end)
            return
        end
        
        -- الحصول على اسم اللاعب من plrVars.plrCardName
        local playerCardName = getPlayerCardName(targetPlayer)
        
        -- عرض معلومات اللاعب الأساسية
        local playerNameLabel = Instance.new("TextLabel")
        playerNameLabel.Name = "PlayerNameLabel"
        playerNameLabel.LayoutOrder = 1
        playerNameLabel.BackgroundTransparency = 1
        playerNameLabel.Text = "الاسم: " .. playerCardName
        playerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerNameLabel.Font = Enum.Font.Gotham
        playerNameLabel.TextScaled = true
        playerNameLabel.TextXAlignment = Enum.TextXAlignment.Right
        playerNameLabel.Parent = playerInfoFrame
        
        local playerCardIdLabel = Instance.new("TextLabel")
        playerCardIdLabel.Name = "PlayerCardIdLabel"
        playerCardIdLabel.LayoutOrder = 2
        playerCardIdLabel.BackgroundTransparency = 1
        playerCardIdLabel.Text = "رقم البطاقة: " .. cardId
        playerCardIdLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerCardIdLabel.Font = Enum.Font.Gotham
        playerCardIdLabel.TextScaled = true
        playerCardIdLabel.TextXAlignment = Enum.TextXAlignment.Right
        playerCardIdLabel.Parent = playerInfoFrame
        
        local playerIdLabel = Instance.new("TextLabel")
        playerIdLabel.Name = "PlayerIdLabel"
        playerIdLabel.LayoutOrder = 3
        playerIdLabel.BackgroundTransparency = 1
        playerIdLabel.Text = "الرقم: " .. targetPlayer.UserId
        playerIdLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        playerIdLabel.Font = Enum.Font.Gotham
        playerIdLabel.TextScaled = true
        playerIdLabel.TextXAlignment = Enum.TextXAlignment.Right
        playerIdLabel.Parent = playerInfoFrame
        
        -- عرض فلوس البنك إذا كانت موجودة
        local plrVars = targetPlayer:FindFirstChild("plrVars")
        if plrVars then
            local plrBankMoney = plrVars:FindFirstChild("plrBankMoney")
            if plrBankMoney then
                local bankMoneyLabel = Instance.new("TextLabel")
                bankMoneyLabel.Name = "BankMoneyLabel"
                bankMoneyLabel.LayoutOrder = 4
                bankMoneyLabel.BackgroundTransparency = 1
                bankMoneyLabel.Text = "فلوس البنك: " .. plrBankMoney.Value
                bankMoneyLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                bankMoneyLabel.Font = Enum.Font.GothamBold
                bankMoneyLabel.TextScaled = true
                bankMoneyLabel.TextXAlignment = Enum.TextXAlignment.Right
                bankMoneyLabel.Parent = playerInfoFrame
            end
        end
        
        -- جواهر لاعب
        local plrVars = targetPlayer:FindFirstChild("plrVars")
        if plrVars then
            local plrGems = plrVars:FindFirstChild("plrGems")
            if plrGems then
                local GemsLabel = Instance.new("TextLabel")
                GemsLabel.Name = "GemsLabel"
                GemsLabel.LayoutOrder = 5
                GemsLabel.BackgroundTransparency = 1
                GemsLabel.Text = "جواهر: " .. plrGems.Value
                GemsLabel.TextColor3 = Color3.fromRGB(181, 126, 220)
                GemsLabel.Font = Enum.Font.GothamBold
                GemsLabel.TextScaled = true
                GemsLabel.TextXAlignment = Enum.TextXAlignment.Right
                GemsLabel.Parent = playerInfoFrame
            end
        end
        
        -- لفل لاعب
        local plrVars = targetPlayer:FindFirstChild("plrVars")
        if plrVars then
            local plrBaseLvl = plrVars:FindFirstChild("plrBaseLvl")
            if plrBaseLvl then
                local BaseLvlLabel = Instance.new("TextLabel")
                BaseLvlLabel.Name = "BaseLvlLabel"
                BaseLvlLabel.LayoutOrder = 6
                BaseLvlLabel.BackgroundTransparency = 1
                BaseLvlLabel.Text = "لفله: " .. plrBaseLvl.Value
                BaseLvlLabel.TextColor3 = Color3.fromRGB(255, 223, 0)
                BaseLvlLabel.Font = Enum.Font.GothamBold
                BaseLvlLabel.TextScaled = true
                BaseLvlLabel.TextXAlignment = Enum.TextXAlignment.Right
                BaseLvlLabel.Parent = playerInfoFrame
            end
        end

        -- مجموع جواهر
        local plrVars = targetPlayer:FindFirstChild("plrVars")
        if plrVars then
            local plrGemsTotal = plrVars:FindFirstChild("plrGemsTotal")
            if plrGemsTotal then
                local GemsTotalLabel = Instance.new("TextLabel")
                GemsTotalLabel.Name = "GemsTotalLabel"
                GemsTotalLabel.LayoutOrder = 7
                GemsTotalLabel.BackgroundTransparency = 1
                GemsTotalLabel.Text = "مجموع جواهر الي شحنها: " .. plrGemsTotal.Value
                GemsTotalLabel.TextColor3 = Color3.fromRGB(181, 126, 220)
                GemsTotalLabel.Font = Enum.Font.GothamBold
                GemsTotalLabel.TextScaled = true
                GemsTotalLabel.TextXAlignment = Enum.TextXAlignment.Right
                GemsTotalLabel.Parent = playerInfoFrame
            end
        end

        -- نقاط اجرامه 
        local plrVars = targetPlayer:FindFirstChild("plrVars")
        if plrVars then
            local plrWantedPoints = plrVars:FindFirstChild("plrWantedPoints")
            if plrWantedPoints then
                local WantedPointsLabel = Instance.new("TextLabel")
                WantedPointsLabel.Name = "WantedPointsLabel"
                WantedPointsLabel.LayoutOrder = 8
                WantedPointsLabel.BackgroundTransparency = 1
                WantedPointsLabel.Text = "نقاط اجرام: " .. plrWantedPoints.Value
                WantedPointsLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
                WantedPointsLabel.Font = Enum.Font.GothamBold
                WantedPointsLabel.TextScaled = true
                WantedPointsLabel.TextXAlignment = Enum.TextXAlignment.Right
                WantedPointsLabel.Parent = playerInfoFrame
            end
        end

        -- عرض العناصر في الحقيبة
        local plrBag = targetPlayer:FindFirstChild("plrBag")
        if plrBag then
            local hasItems = false
            for _, item in ipairs(plrBag:GetChildren()) do
                if item.Value >= 1 then -- تحقق من أن الكمية أكبر من أو تساوي 1
                    local itemWidget = createItemWidget(item.Name, item.Value)
                    if itemWidget then
                        itemWidget.Parent = inventoryContainer
                        hasItems = true
                    end
                end
            end
            
            if not hasItems then
                local noItemsLabel = Instance.new("TextLabel")
                noItemsLabel.Name = "NoItemsLabel"
                noItemsLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
                noItemsLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
                noItemsLabel.BackgroundTransparency = 1
                noItemsLabel.Text = "لا توجد عناصر في الحقيبة"
                noItemsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                noItemsLabel.Font = Enum.Font.Gotham
                noItemsLabel.TextScaled = true
                noItemsLabel.Parent = inventoryContainer
            end
        else
            local noItemsLabel = Instance.new("TextLabel")
            noItemsLabel.Name = "NoItemsLabel"
            noItemsLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
            noItemsLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
            noItemsLabel.BackgroundTransparency = 1
            noItemsLabel.Text = "لا توجد حقيبة للاعب"
            noItemsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            noItemsLabel.Font = Enum.Font.Gotham
            noItemsLabel.TextScaled = true
            noItemsLabel.Parent = inventoryContainer
        end
        
        -- عرض العناصر في الخزنة
        local whereHouseData = targetPlayer:FindFirstChild("WhereHouseData")
        if whereHouseData then
            local userIdFolder = whereHouseData:FindFirstChild(tostring(targetPlayer.UserId))
            if userIdFolder then
                local warehouseBag = userIdFolder:FindFirstChild("plrBag")
                if warehouseBag then
                    local hasItems = false
                    for _, item in ipairs(warehouseBag:GetChildren()) do
                        if item.Value >= 1 then -- تحقق من أن الكمية أكبر من أو تساوي 1
                            local itemWidget = createItemWidget(item.Name, item.Value)
                            if itemWidget then
                                itemWidget.Parent = warehouseContainer
                                hasItems = true
                            end
                        end
                    end
                    
                    if not hasItems then
                        local noItemsLabel = Instance.new("TextLabel")
                        noItemsLabel.Name = "NoItemsLabel"
                        noItemsLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
                        noItemsLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
                        noItemsLabel.BackgroundTransparency = 1
                        noItemsLabel.Text = "لا توجد عناصر في الخزنة"
                        noItemsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                        noItemsLabel.Font = Enum.Font.Gotham
                        noItemsLabel.TextScaled = true
                        noItemsLabel.Parent = warehouseContainer
                    end
                else
                    local noItemsLabel = Instance.new("TextLabel")
                    noItemsLabel.Name = "NoItemsLabel"
                    noItemsLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
                    noItemsLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
                    noItemsLabel.BackgroundTransparency = 1
                    noItemsLabel.Text = "لا توجد خزنة للاعب"
                    noItemsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
                    noItemsLabel.Font = Enum.Font.Gotham
                    noItemsLabel.TextScaled = true
                    noItemsLabel.Parent = warehouseContainer
                end
            end
        end
        
        switchTab(currentTab)
    end

    -- حدث البحث
    searchButton.MouseButton1Click:Connect(function()
        local cardId = inputBox.Text
        if cardId and cardId ~= "" then
            displayPlayerData(cardId)
        end
    end)

    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local cardId = inputBox.Text
            if cardId and cardId ~= "" then
                displayPlayerData(cardId)
            end
        end
    end)

    -- رسالة تأكيد تحميل الواجهة
    print("تم تحميل واجهة عرض بيانات اللاعب بنجاح!")
end

-- التحقق من الرمز
submitButton.MouseButton1Click:Connect(function()
    if codeBox.Text == "DMX8100" then
        createMainInspectionGui()
    else
        errorLabel.Text = "رمز التفتيش غير صحيح!"
        errorLabel.Visible = true
        task.wait(2)
        errorLabel.Visible = false
    end
end)

codeBox.FocusLost:Connect(function(enterPressed)
    if enterPressed and codeBox.Text == "DMX8100" then
        createMainInspectionGui()
    end
end)
