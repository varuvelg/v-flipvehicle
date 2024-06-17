# Varu's Flip vehicle 
Vehicle flipover script

## Depedencies
- [ox_lib](https://github.com/overextended/ox_lib/releases)

## Installation
1. Ensure you have all dependencies above installed
2. Add v-flipvehicle to your 'resources' directory
3. Add 'ensure v-flipvehicle' in your 'server.cgf'
4. Add funvtion v-carflip where you want it to be used like qb-target or qb-radialmenu those two are also shown below
- Add qb-target function under Config.TargetBones in init.lua
```lua
{
    type = "client",
    event = "v-carflip:flipcar",
    icon = "fas fa-car-crash",
    label = "Flip Vehicle",
},
```
- Add qb-radialmenu function under Config.lua
```lua
{
    id = 'flipvehicle',
    title = 'Flip Vehicle',
    icon = 'car-crash',
    type = 'client',
    event = 'v-carflip:flipcar',
    shouldClose = true
},
```
