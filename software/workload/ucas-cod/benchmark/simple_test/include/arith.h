#pragma once

typedef struct {
    long long unsigned q, r;
} mdiv_t;

#define bit(d, i) ((d >> i) & 1)

#define bit_set(d, i, b) (d | (b << i))

static mdiv_t mdiv_u(long long unsigned N, long long unsigned D)
{
    long long unsigned Q = 0, R = 0;
    for (int i = sizeof(N) * 8 - 1; i >= 0; i--) {
        R = (R << 1) | bit(N, i);
        if (R >= D) {
            R = R - D;
            Q = bit_set(Q, i, 1);
        }
    }
    mdiv_t t = { Q, R };
    return t;
}

static mdiv_t mdiv(long long int N, long long int D)
{
    mdiv_t t;
    if (D == 0) {
    }

    if (D < 0) {
        t = mdiv(N, -D);
        t.q = -t.q;
        return t;
    }

    if (N < 0) {
        t = mdiv(-N, D);
        if (t.r == 0) {
            t.q = -t.q;
            return t;
        }
        else {
            t.q = -t.q - 1;
            t.r = D - t.r;
            return t;
        }
    }

    return mdiv_u(N, D);
}

static long long unsigned mmul_u(long long unsigned X, long long unsigned Y)
{
    long long unsigned Z = 0;
    for (unsigned i = 0; i < sizeof(X) * 8; i++) {
        if (bit(Y, i)) {
            Z = Z + (X << i);
        }
    }
    return Z;
}

static long long int mmul(long long int X, long long int Y)
{
    int sign = 1;
    if (X < 0) {
        X = -X;
        sign = -sign;
    }
    if (Y < 0) {
        Y = -Y;
        sign = -sign;
    }
    long long int Z = mmul_u(X, Y);
    return sign ? Z : -Z;
}
