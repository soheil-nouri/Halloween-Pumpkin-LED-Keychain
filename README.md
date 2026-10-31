# 🎃 Goofy Jack-o'-Lantern LED Keychain (Micro-Enclosure)

[![FreeCAD](https://img.shields.io/badge/CAD-FreeCAD%201.0%20%2F%201.1-orange?logo=freecad)](https://www.freecad.org/)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Printable: No Supports](https://img.shields.io/badge/Supports-None%20Needed-brightgreen)](#-3d-printing--slicing-guide)

A compact, durable, and fully functional 3D-printable Halloween Pumpkin Keychain micro-enclosure. It features an expressive, goofy "cute idiot" Jack-o'-Lantern face with mismatched chunky teeth, friction-fit collars for two 3mm LEDs, an internal CR1220 battery cradle, and a dedicated housing with a bottom toggle slot for an **SS-12D00** micro slide switch.

Designed specifically because no complete micro-enclosure keychain pumpkin existed that combined **fastener-free snap-fitting, internal electronics integration, pocket-safe key loop locking, and support-free FDM printing**!

---

## ✨ Features

- **Organic Pumpkin Shape**: 8 vertical bulbous lobes, decorative organic stem, and heavy-duty 1.8 mm wall thickness.
- **Goofy "Cute Idiot" Expression**:
  - Chunky triangular nose.
  - One tooth pointing **DOWN** from the top jaw (viewer's right).
  - One tooth pointing **UP** from the bottom jaw (viewer's left).
  - Robust bridges (>1.7 mm) so fine features never snap during daily pocket carry.
- **Integrated LED Optics**: Two internal 3.2 mm diameter cylindrical collars behind the eyes to snugly friction-fit standard 3mm through-hole LEDs.
- **Interlocking Snap-Fit Seam**: 1.0 mm stepped tongue-and-groove joint with **0.25 mm FDM printing clearance**. Press-fits securely by hand without screws or glue.
- **Fail-Safe Pocket Locking**: The reinforced top loop (6.5 mm OD, 3.2 mm ID) is split down the center seam. When you insert a standard metal keychain split-ring, the ring **physically clamps both halves shut**, ensuring it can never accidentally pop open in your pocket!
- **Easy Maintenance**: A discrete 4.2 mm x 0.7 mm pry slot at the bottom parting line lets you easily pop it open with a coin or fingernail to swap the battery.
- **100% Hollow Switch Cradle**: A custom internal bay that holds an **SS-12D00** micro slide switch, with a clean bottom through-slot allowing the toggle lever to protrude for easy ON/OFF control.

---

## 🛠️ Bill of Materials (BOM)

| Item | Qty | Specification / Notes |
| :--- | :---: | :--- |
| **Front Cover** | 1 | 3D printed (Orange or Glow-in-the-dark PLA/PETG) |
| **Back Cover** | 1 | 3D printed |
| **3mm LEDs** | 2 | Standard 3mm through-hole LEDs (Yellow, Warm White, or Orange) |
| **Battery** | 1 | **CR1220** (or CR1225) 3V Lithium Coin Cell |
| **Micro Slide Switch** | 1 | **SS-12D00** (1P2T, body size 8.5 x 4.0 x 4.0 mm) |
| **Thin Wire** | ~10 cm | 30 AWG wrapping wire, thin enameled wire, or copper tape |
| **Keyring** | 1 | Standard metal split-ring (20 mm – 28 mm diameter) |

---

## ⚡ Circuit & Wiring Diagram

The circuit runs directly off a 3V CR1220 lithium coin cell without resistors (3V coin cells have sufficient internal resistance for two standard 3mm LEDs connected in parallel):

```
                     +---------------------+
                     |  CR1220 3V Battery  |
                     |  (+) Top Terminal   |
                     +----------+----------+
                                |
                                v
                     +---------------------+
                     |  SS-12D00 Switch    |
                     |  [Pin 1]   [Center] |
                     +----+----------+-----+
                          |          |
                      (OFF)          | (ON)
                                     v
                        +------------+------------+
                        |                         |
                        v                         v
               +-----------------+       +-----------------+
               |  LED 1 (3mm)    |       |  LED 2 (3mm)    |
               |  (+) Anode      |       |  (+) Anode      |
               |  (-) Cathode    |       |  (-) Cathode    |
               +--------+--------+       +--------+--------+
                        |                         |
                        +------------+------------+
                                     |
                                     v
                     +---------------------+
                     |  CR1220 3V Battery  |
                     |  (-) Bottom Terminal|
                     +---------------------+
```

### Quick DIY Assembly (No Soldering Required!):
1. **Insert LEDs**: Push the two 3mm LEDs into the two circular collars inside the **Front Cover**.
2. **Mount Switch**: Drop the **SS-12D00** switch into the bottom cradle of the **Back Cover**. The toggle lever will protrude through the bottom slot.
3. **Connect Wires**:
   - Twist the longer legs (Anodes `+`) of both LEDs together and attach a wire leading to the switch center pin.
   - Connect the switch outer pin to the positive (`+`) top face of the CR1220 battery.
   - Twist the shorter legs (Cathodes `-`) of both LEDs together and run a wire to the negative (`-`) bottom face of the battery.
   - Secure the wires to the battery using a small piece of electrical tape or copper foil tape.
4. **Seat the Battery**: Slide the CR1220 coin cell into the vertical guide rails inside the Back Cover.
5. **Snap Together**: Align the Front and Back covers and press firmly until they click together.
6. **Thread Keyring**: Feed your keychain split-ring through the top hole. Done!

---

## 🖨️ 3D Printing & Slicing Guide

- **Print Orientation**: Place both halves **flat with their mating seam face directly on the build plate** (Parting face down).
- **Supports**: **NONE** required! Both halves are designed with 45° self-supporting draft angles.
- **Layer Height**: `0.12 mm` to `0.16 mm` (recommended for smooth bulbous lobes and crisp teeth).
- **Wall Loops / Perimeters**: `4` walls minimum (ensures the 1.8 mm walls are 100% solid plastic for maximum toughness).
- **Infill**: `20%` – `30%` (Gyroid or Grid).
- **Material**: PLA, PLA+, or PETG (Pumpkin Orange, Neon Orange, or Glow-in-the-dark).

---

## 📁 Repository Contents

```
Halloween-Pumpkin-LED-Keychain/
├── STLs/
│   ├── pumpkin_front_cover.stl      # Front half with goofy face & LED pockets
│   ├── pumpkin_back_cover.stl       # Back half with battery cradle & switch slot
│   └── pumpkin_both_parts_pair.stl  # Both halves positioned together on the bed
├── CAD/
│   ├── Halloween_Pumpkin_Completed.FCStd  # Native FreeCAD 1.0 / 1.1 editable file
│   ├── HalloweenPumpkinKeychain.FCMacro   # Parametric FreeCAD Python generator macro
│   └── HalloweenPumpkinKeychain.scad      # OpenSCAD parametric script
├── LICENSE                          # Creative Commons Attribution-ShareAlike 4.0
└── README.md                        # Documentation & build instructions
```

---

## 📄 License & Sharing

This project is released under the **Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)**.

You are free to:
- **Share**: Copy and redistribute the material in any medium or format.
- **Adapt**: Remix, transform, and build upon the material for any purpose, even commercially.

Under the following terms:
- **Attribution**: You must give appropriate credit.
- **ShareAlike**: If you remix, transform, or build upon the material, you must distribute your contributions under the same license.

🎃 *Happy Making & Happy Halloween!*
