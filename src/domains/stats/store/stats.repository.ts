import { Stats } from '../entities/stats.entity';

export interface StatsRepository {
    create(stats: Partial<Stats>): Promise<Stats>;
    findByPlayerId(playerId: string): Promise<Stats | null>;
}
