/**
 * payment service.
 */

import { factories } from '@strapi/strapi';
import { CollectionTypeService } from '@strapi/strapi/lib/core-api/service';
import mergeDeep from 'merge-deep';

export default factories.createCoreService('api::payment.payment', (): CollectionTypeService => {
  return {
    async find(params) {
      params = mergeDeep({ filters: { deleted_at: { $null: true } } }, params);
      const { results, pagination } = await super.find(params);
      return { results, pagination };
    },
    async findOne(entityId, params) {
      params = mergeDeep({ filters: { deleted_at: { $null: true } } }, params);
      const result = await super.findOne(entityId, params);
      return result;
    },
    async update(entityId, params) {
      const result = await super.update(entityId, params);
      return result;
    },
    async delete(entityId, params) {
      params = { data: { deleted_at: new Date().toISOString() } };
      const result = await super.update(entityId, params);
      return result;
    },
  };
});
