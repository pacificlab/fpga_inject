
# How to Work with Data from the TDC

## Overview

To process data from the Time-to-Digital Converter (TDC), follow the steps below. This will help convert raw binary data into a meaningful Hamming Weight distribution across bins.

---

## 📥 Input

- When you receive data from **Hterm**, copy it in **binary format** into a `.txt` file.
- Each **line** in the file should contain a **12-byte binary packet** (i.e., 96 bits) for a **90-bin sensor**.

Depending on your TDC version (i.e., number of bins) and your analysis goals, use the following procedure to generate a script for processing.

---

## 🛠️ Processing Steps

1. **Flip Each Byte**  
   Reverse the bit order of each 8-bit byte.

2. **Concatenate the Flipped Bytes**  
   Process one pack at a time (12 bytes per pack), and combine the reversed bytes into a single binary string.

3. **Remove `3'b111` from the Beginning and End**  
   These are optional/additional bits and should be discarded before analysis.

4. **Count the Number of Ones**  
   Compute the **Hamming weight** (number of '1's) in the processed binary string.

5. **Output**  
   A list of Hamming weights, one per pack — each value corresponds to a bin in the TDC.

---

## 🔢 Example

### Original 12 Bytes:

```
11111111  
11111111  
11111111  
11111111  
11111111  
11111111  
11111111  
11111111  
11111111  
11111111  
10000111  
11100001
```

---

### Step 1: Flip Each Byte (Bit Reversal)

| Original   | Flipped    |
|------------|------------|
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 11111111 → | 11111111   |
| 10000111 → | 11100001   |
| 11100001 → | 10000111   |

---

### Step 2: Concatenate Flipped Bytes

```
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000110000111
```

> Total: 96 bits

---

### Step 3: Remove Header/Footer Bits

- **Remove first 3 bits**: `111`  
- **Remove last 3 bits**: `111`

### Resulting 90-bit string:

```
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110000110000
```

---

### Step 4: Count Hamming Weight

- Number of `'1'`s: **83**

---

### ✅ Final Output

- **Bin Hamming Weight**: `83`

> This value represents the count of logic high bits (`1`s) for this bin in the TDC.
