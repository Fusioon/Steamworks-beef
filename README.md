# Steamworks-beef

_Steamworks-beef_ is a Beef Wrapper for Valve's Steamworks API. 
Most of the bindings and wrappers are automatically generated from json file provided by Valve. 
The generator is included in this repository, so you can tweak it to your liking.
_Steamworks-beef_ tries to stay close to the original C++ API.
> **Attention!** These bindings are still in development and mostly untested. Bugs may occur.

* Author: [Fusion](https://github.com/Fusioon)
* License: [MIT](http://www.opensource.org/licenses/mit-license.php)
* [Reporting Issues](https://github.com/Fusioon/Steamworks-beef/issues)
  Note that only Steamworks-beef specific issues should be reported, general API questions/issues should be asked on the [Steamworks discussion board](http://steamcommunity.com/groups/steamworks/discussions).

## Changes from the original C++ API
* Enum value names are shortened to omit typename
* Field names don't have the `m_` prefix
* Callback ids are defined as `CALLBACK_ID` instead of `k_iCallback`
* Wrappers use `ref` and `out` keywords when appropriate. (Experimental, if you find code where this is not correct please submit an issue) 
* Wrappers take and return `StringView` instead of `const char*` (There is a define `STEAMWORKS_AUTO_TERMINATE_STRINGS` which can be used if your strings are not null terminated)

## Installation

* Clone this repository
* Download [SteamworksSDK](https://partner.steamgames.com/doc/sdk)
* Extract the downloaded zip and move the `sdk` folder into `Steamworks-beef/Steamworks/`
* Add Steamworks project into your workspace and add it into your project dependencies
* Create `steam_appid.txt` next to the executable (This file must contain yor appid, otherwise calling `SteamAPI.Init` will fail. If you don't have appid just use `480`)

## How to use
* Before using any SteamAPI functions you have to call `SteamAPI.Init()`. This will initialize the SteamAPI, and retrieve all required interfaces. This call may also fail, in that case you will have to refer to the SteamworksSDK documentation found [here](https://partner.steamgames.com/doc/sdk/api).
* At least once a second you should call `SteamAPI.RunCallbacks()` (Most games call this once per render-frame). All registered listener functions will be invoked during this call, in the callers thread context.
* When you are done using the Steamworks API you should call `SteamAPI.Shutdown()` to release the resources used by your application internally within Steam.

## More Info
- More info about **SteamworksAPI** (https://partner.steamgames.com/doc/api)
- More info about **BeefLang** (https://www.beeflang.org)

## Contribution

I'll be glad for any contribution & pull requests