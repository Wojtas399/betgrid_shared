from pydantic import BaseModel


class RaceBetPoints(BaseModel):
    p1: float
    p2: float
    p3: float
    p10: float
    fastest_lap: float
    dnf_driver1: float
    dnf_driver2: float
    dnf_driver3: float
    safety_car: float
    red_flag: float
    podium_and_p10: float
    podium_and_p10_multiplier: float | None
    dnf: float
    dnf_multiplier: float | None
    safety_car_and_red_flag: float
    total: float

    def to_dict(self):
        return {
            'p1': self.p1,
            'p2': self.p2,
            'p3': self.p3,
            'p10': self.p10,
            'fastestLap': self.fastest_lap,
            'dnfDriver1': self.dnf_driver1,
            'dnfDriver2': self.dnf_driver2,
            'dnfDriver3': self.dnf_driver3,
            'safetyCar': self.safety_car,
            'redFlag': self.red_flag,
            'podiumAndP10': self.podium_and_p10,
            'podiumAndP10Multiplier': self.podium_and_p10_multiplier,
            'totalDnf': self.dnf,
            'dnfMultiplier': self.dnf_multiplier,
            'safetyCarAndRedFlag': self.safety_car_and_red_flag,
            'total': self.total,
        }
