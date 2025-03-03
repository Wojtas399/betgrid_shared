from pydantic import BaseModel


class QualiBetPoints(BaseModel):
    q3_p1: float
    q3_p2: float
    q3_p3: float
    q3_p4: float
    q3_p5: float
    q3_p6: float
    q3_p7: float
    q3_p8: float
    q3_p9: float
    q3_p10: float
    q2_p11: float
    q2_p12: float
    q2_p13: float
    q2_p14: float
    q2_p15: float
    q1_p16: float
    q1_p17: float
    q1_p18: float
    q1_p19: float
    q1_p20: float
    q3: float
    q2: float
    q1: float
    q3_multiplier: float | None
    q2_multiplier: float | None
    q1_multiplier: float | None
    total: float
    multiplier: float | None

    def to_dict(self):
        return {
            'q3P1': self.q3_p1,
            'q3P2': self.q3_p2,
            'q3P3': self.q3_p3,
            'q3P4': self.q3_p4,
            'q3P5': self.q3_p5,
            'q3P6': self.q3_p6,
            'q3P7': self.q3_p7,
            'q3P8': self.q3_p8,
            'q3P9': self.q3_p9,
            'q3P10': self.q3_p10,
            'q2P11': self.q2_p11,
            'q2P12': self.q2_p12,
            'q2P13': self.q2_p13,
            'q2P14': self.q2_p14,
            'q2P15': self.q2_p15,
            'q1P16': self.q1_p16,
            'q1P17': self.q1_p17,
            'q1P18': self.q1_p18,
            'q1P19': self.q1_p19,
            'q1P20': self.q1_p20,
            'totalQ3': self.q3,
            'totalQ2': self.q2,
            'totalQ1': self.q1,
            'q3Multiplier': self.q3_multiplier,
            'q2Multiplier': self.q2_multiplier,
            'q1Multiplier': self.q1_multiplier,
            'total': self.total,
            'multiplier': self.multiplier,
        }
