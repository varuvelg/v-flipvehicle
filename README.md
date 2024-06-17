# Varu's Flip vehicle 
Vehicle flipover script

## Depedencies
- [ox_lib](https://github.com/overextended/ox_lib/releases)

## Installation
- Ensure you have all dependencies above installed
- Add v-flipvehicle to your 'resources' directory
- Add 'ensure v-flipvehicle' in your 'server.cgf'
- Add qb-target function under Config.TargetBones in init.lua
```
{
    type = "client",
    event = "v-carflip:flipcar",
    icon = "fas fa-car-crash",
    label = "Flip Vehicle",
},```
or
- Add qb-radialmenu function under Config.lua
```
{
    id = 'flipvehicle',
    title = 'Flip Vehicle',
    icon = 'car-crash',
    type = 'client',
    event = 'v-carflip:flipcar',
    shouldClose = true
},```
