/* we do all our work in a transaction */
begin transaction;

-- Avoid all the unnecessary NOTICE messages
set client_min_messages = warning;

/* TODO: for security reasons, a non-superuser should be created and used
create user spacewalk;

\c spacewalk

create schema spacewalk;
*/

/* special table; TODO: to be removed once we start using Orafce */
\i tables/dual.sql

/* tables go here */
\i tables/rhnCVE.sql
\i tables/rhnPackageName.sql
\i tables/web_customer.sql
\i tables/rhnArchType.sql				
\i tables/rhnChannelArch.sql  			
\i tables/rhnChannelProduct.sql			
\i tables/rhnProductName.sql			
\i tables/rhnChannel.sql				
\i tables/rhnChannelFamily.sql			
\i tables/rhnPublicChannelFamily.sql
\i tables/web_contact.sql
\i tables/rhnPrivateChannelFamily.sql
\i tables/rhnServerArch.sql
\i tables/rhnProvisionState.sql
\i tables/rhnServer.sql
\i tables/rhnServerChannel.sql
\i tables/rhnServerGroupType.sql
\i tables/rhnException.sql
\i tables/rhnServerGroup.sql
\i tables/rhnPackageEVR.sql
\i tables/rhnPackageArch.sql
\i tables/rhnPackageGroup.sql
\i tables/rhnSourceRPM.sql
\i tables/rhnPackage.sql
\i tables/rhnChannelPackage.sql
\i tables/rhnSet.sql
\i tables/rhn_command_groups.sql
\i tables/rhn_command_class.sql
\i tables/rhn_command_requirements.sql
\i tables/rhn_command.sql
\i tables/rhn_probe_types.sql
\i tables/rhn_probe.sql
\i tables/rhn_command_target.sql
\i tables/rhn_physical_location.sql
\i tables/rhn_sat_cluster.sql
\i tables/rhn_check_probe.sql
\i tables/rhn_check_suites.sql
\i tables/rhn_check_suite_probe.sql
\i tables/rhn_command_center_state.sql
\i tables/rhn_widget.sql
\i tables/rhn_semantic_data_type.sql
\i tables/rhn_command_parameter.sql
\i tables/rhn_command_queue_commands.sql
\i tables/rhn_command_queue_execs_bk.sql
\i tables/rhn_command_queue_instances.sql
\i tables/rhn_command_queue_execs.sql
\i tables/rhn_command_queue_instances_bk.sql
\i tables/rhn_command_queue_params.sql
\i tables/rhn_command_queue_sessions.sql
\i tables/rhn_config_group.sql
\i tables/rhn_environment.sql
\i tables/rhn_config_macro.sql
\i tables/rhn_config_security_type.sql
\i tables/rhn_config_parameter.sql
\i tables/rhn_method_types.sql
\i tables/rhn_pager_types.sql
\i tables/rhn_schedule_types.sql
\i tables/rhn_schedules.sql
\i tables/rhn_time_zone_names.sql
\i tables/rhn_notification_formats.sql
\i tables/rhnTimezone.sql
\i tables/rhnUserInfo.sql
\i tables/rhn_contact_methods.sql
\i tables/rhn_strategies.sql
\i tables/rhn_contact_groups.sql
\i tables/rhn_contact_group_members.sql
\i tables/web_user_prefix.sql
\i tables/web_user_personal_info.sql
\i tables/rhn_current_alerts.sql
\i tables/rhn_current_state_summaries.sql
\i tables/rhn_db_environment.sql
\i tables/rhn_deployed_probe.sql
\i tables/rhn_host_probe.sql
\i tables/rhn_host_check_suites.sql
\i tables/rhn_os.sql
\i tables/rhn_server_monitoring_info.sql
\i tables/rhnServerNetInterface.sql
\i tables/rhn_interface_monitoring.sql
\i tables/rhn_ll_netsaint.sql
\i tables/rhn_quanta.sql
\i tables/rhn_units.sql
\i tables/rhn_metrics.sql
\i tables/rhn_multi_scout_threshold.sql
\i tables/rhn_notifservers.sql
\i tables/rhn_os_commands_xref.sql
\i tables/rhn_probe_param_value.sql
\i tables/rhn_probe_state.sql
\i tables/rhn_redirect_types.sql
\i tables/rhn_redirects.sql
\i tables/rhn_redirect_match_types.sql
\i tables/rhn_redirect_criteria.sql
\i tables/rhn_redirect_email_targets.sql
\i tables/rhn_redirect_group_targets.sql
\i tables/rhn_redirect_method_targets.sql
\i tables/rhn_sat_cluster_probe.sql
\i tables/rhn_satellite_state.sql
\i tables/rhn_sat_node.sql
\i tables/rhn_sat_node_probe.sql
\i tables/rhn_schedule_days_norm.sql
\i tables/rhn_schedule_days.sql
\i tables/rhn_schedule_weeks.sql
\i tables/rhn_service_probe_origins.sql
\i tables/rhn_snmp_alert.sql
\i tables/rhn_threshold_type.sql
\i tables/rhn_url_probe.sql
\i tables/rhn_url_probe_step.sql
\i tables/PXTSessions.sql
\i tables/rhnActionType.sql
\i tables/rhnAction.sql
\i tables/rhnActionStatus.sql
\i tables/rhnServerAction.sql
\i tables/rhnConfigChannelType.sql
\i tables/rhnConfigChannel.sql
\i tables/rhnActionConfigChannel.sql
\i tables/rhnActionConfigDateFile.sql
\i tables/rhnActionConfigDate.sql
\i tables/rhnConfigFileName.sql
\i tables/rhnConfigFileFailure.sql
\i tables/rhnConfigFileState.sql
\i tables/rhnConfigFile.sql
\i tables/rhnConfigInfo.sql
\i tables/rhnConfigContent.sql
\i tables/rhnConfigFileType.sql
\i tables/rhnConfigRevision.sql
\i tables/rhnActionConfigFileName.sql
\i tables/rhnActionConfigRevision.sql
\i tables/rhnActionConfigRevisionResult.sql
\i tables/rhnActionDaemonConfig.sql
\i tables/rhnErrataSeverity.sql
\i tables/rhnErrata.sql
\i tables/rhnActionErrataUpdate.sql
\i tables/rhnKSTreeType.sql
\i tables/rhnKSInstallType.sql
\i tables/rhnKickstartableTree.sql
\i tables/rhnActionKickstart.sql
\i tables/rhnFileList.sql
\i tables/rhnActionKickstartFileList.sql
\i tables/rhnKSData.sql
\i tables/rhnKickstartSessionState.sql
\i tables/rhnServerProfileType.sql
\i tables/rhnServerProfile.sql
\i tables/rhnKickstartVirtualizationType.sql
\i tables/rhnKickstartSession.sql
\i tables/rhnActionKickstartGuest.sql
\i tables/rhnActionPackage.sql
\i tables/rhnActionPackageAnswerfile.sql
\i tables/rhnPackageDelta.sql
\i tables/rhnActionPackageDelta.sql
\i tables/rhnActionPackageOrder.sql
\i tables/rhnPackageCapability.sql
\i tables/rhnActionPackageRemovalFailure.sql
\i tables/rhnActionScript.sql
\i tables/rhnTransaction.sql
\i tables/rhnActionTransactions.sql
\i tables/rhnActionVirtDestroy.sql
\i tables/rhnActionVirtReboot.sql
\i tables/rhnActionVirtRefresh.sql
\i tables/rhnActionVirtResume.sql
\i tables/rhnActionVirtSchedulePoller.sql
\i tables/rhnActionVirtSetMemory.sql
\i tables/rhnActionVirtShutdown.sql
\i tables/rhnActionVirtStart.sql
\i tables/rhnActionVirtSuspend.sql
\i tables/rhnActionVirtVcpu.sql
\i tables/rhnRegToken.sql
\i tables/rhnActivationKey.sql
\i tables/rhnAllowTrust.sql
\i tables/rhnAppInstallInstance.sql
\i tables/rhnAppInstallSession.sql
\i tables/rhnAppInstallSessionData.sql
\i tables/rhnArchTypeActions.sql
\i tables/rhnBeehivePathMap.sql
\i tables/rhnPackageNEVRA.sql
\i tables/rhnErrataFileType.sql
\i tables/rhnSnapshotInvalidReason.sql
\i tables/rhnTagName.sql
\i tables/rhnTag.sql
\i tables/rhnBlacklistObsoletes.sql
\i tables/rhnChannelComps.sql
\i tables/rhnChannelCloned.sql
\i tables/rhnFile.sql
\i tables/rhnDownloadType.sql
\i tables/rhnDownloads.sql
\i tables/rhnChannelDownloads.sql
\i tables/rhnChannelErrata.sql
\i tables/rhnChannelFamilyMembers.sql
\i tables/rhnVirtSubLevel.sql
\i tables/rhnChannelFamilyVirtSubLevel.sql
\i tables/rhnChannelNewestPackageAudit.sql
\i tables/rhnChannelNewestPackage.sql
\i tables/rhnChannelPackageArchCompat.sql
\i tables/rhnSnapshot.sql
\i tables/rhnSnapshotChannel.sql
\i tables/rhnChannelParent.sql
\i tables/rhnChannelPermissionRole.sql
\i tables/rhnChannelPermission.sql
\i tables/rhnChannelTrust.sql
\i tables/rhnClientCapabilityName.sql
\i tables/rhnClientCapability.sql
\i tables/rhn_command_param_threshold.sql
\i tables/rhnSnapshotConfigChannel.sql
\i tables/rhnSnapshotConfigRevision.sql
\i tables/rhnOrgQuota.sql
\i tables/rhnCpuArch.sql
\i tables/rhnCpu.sql
\i tables/rhnCryptoKeyType.sql
\i tables/rhnCryptoKey.sql
\i tables/rhnCryptoKeyKickstart.sql
\i tables/rhnCustomDataKey.sql
\i tables/rhnDaemonState.sql
\i tables/rhnDailySummaryQueue.sql
\i tables/rhnDevice.sql
\i tables/rhnDistChannelMap.sql
\i tables/rhnEmailAddressState.sql
\i tables/rhnEmailAddress.sql
\i tables/rhnEmailAddressLog.sql
\i tables/rhnEntitlementLog.sql
\i tables/rhnErrataBuglist.sql
\i tables/rhnErrataTmp.sql
\i tables/rhnErrataBuglistTmp.sql
\i tables/rhnErrataCloned.sql
\i tables/rhnErrataClonedTmp.sql
\i tables/rhnErrataCVE.sql
\i tables/rhnErrataFile.sql
\i tables/rhnErrataFileChannel.sql
\i tables/rhnErrataFileTmp.sql
\i tables/rhnErrataFileChannelTmp.sql
\i tables/rhnPackageSource.sql
\i tables/rhnErrataPackage.sql
\i tables/rhnErrataFilePackageSource.sql
\i tables/rhnErrataFilePackage.sql
\i tables/rhnErrataFilePackageTmp.sql
\i tables/rhnErrataKeyword.sql
\i tables/rhnErrataKeywordTmp.sql
\i tables/rhnErrataNotificationQueue.sql
\i tables/rhnErrataPackageTmp.sql
\i tables/rhnErrataQueue.sql
-- \i tables/rhnFAQClass.sql
-- \i tables/rhnFAQ.sql
\i tables/rhnFeature.sql
\i tables/rhnFileDownload.sql
\i tables/rhnFileListMembers.sql
\i tables/rhnFileLocation.sql
\i tables/rhnGrailComponentChoices.sql
\i tables/rhnUserGroupType.sql
\i tables/rhnGrailComponents.sql
\i tables/rhnIndexerWork.sql
\i tables/rhnInfoPane.sql
\i tables/rhnKickstartChildChannel.sql
\i tables/rhnKickstartCommandName.sql
\i tables/rhnKickstartCommand.sql
\i tables/rhnKickstartDefaultRegToken.sql
\i tables/rhnKickstartDefaults.sql
\i tables/rhnKickstartIPRange.sql
\i tables/rhnKickstartPackage.sql
\i tables/rhnKickstartPreserveFileList.sql
\i tables/rhnKickstartScript.sql
\i tables/rhnKickstartSessionHistory.sql
\i tables/rhnKickstartTimezone.sql
\i tables/rhnKSTreeFile.sql
\i tables/rhnMessagePriority.sql
\i tables/rhnMessageType.sql
\i tables/rhnMessage.sql
\i tables/rhnMonitorGranularity.sql
\i tables/rhnMonitor.sql
\i tables/rhnOrgChannelSettingsType.sql
\i tables/rhnOrgChannelSettings.sql
\i tables/rhnOrgEntitlementType.sql
\i tables/rhnOrgEntitlements.sql
\i tables/rhnOrgErrataCacheQueue.sql
\i tables/rhnOrgInfo.sql
-- \i tables/rhnPackageChangelog.sql
\i tables/rhnPackageConflicts.sql
\i tables/rhnTransactionOperation.sql
\i tables/rhnTransactionPackage.sql
\i tables/rhnPackageDeltaElement.sql
\i tables/rhnPackageFileDeleteQueue.sql
\i tables/rhnPackageFile.sql
\i tables/rhnPackageKeyType.sql
\i tables/rhnPackageProvider.sql
\i tables/rhnPackageKey.sql
\i tables/rhnPackageKeyAssociation.sql
\i tables/rhnPackageObsoletes.sql
\i tables/rhnPackageProvides.sql
\i tables/rhnPackageRequires.sql
\i tables/rhnPackageSense.sql
\i tables/rhnPackageSenseMap.sql
\i tables/rhnPackageSyncBlacklist.sql
\i tables/rhnPathChannelMap.sql
\i tables/rhnProductLine.sql
\i tables/rhnProduct.sql
\i tables/rhnProductChannel.sql
\i tables/rhnProxyInfo.sql
\i tables/rhnPushClientState.sql
\i tables/rhnPushClient.sql
\i tables/rhnPushDispatcher.sql
\i tables/rhnRam.sql
\i tables/rhnRedHatCanonVersion.sql
\i tables/rhnRegTokenChannels.sql
\i tables/rhnRegTokenConfigChannels.sql
\i tables/rhnRegTokenEntitlement.sql
\i tables/rhnRegTokenGroups.sql
\i tables/rhnRegTokenOrgDefault.sql
\i tables/rhnRegTokenPackages.sql
\i tables/rhnRelationshipType.sql
\i tables/rhnReleaseChannelMap.sql
\i tables/rhnSatelliteCert.sql
\i tables/rhnSatelliteChannelFamily.sql
\i tables/rhnSatelliteInfo.sql
\i tables/rhnSatelliteServerGroup.sql
\i tables/rhnSavedSearchType.sql
\i tables/rhnSavedSearch.sql
\i tables/rhnServerActionPackageResult.sql
\i tables/rhnServerActionScriptResult.sql
\i tables/rhnServerActionVerifyMissing.sql
\i tables/rhnServerActionVerifyResult.sql
\i tables/rhnServerCacheInfo.sql
\i tables/rhnServerChannelArchCompat.sql
\i tables/rhnServerConfigChannel.sql
\i tables/rhnServerCustomDataValue.sql
\i tables/rhnServerDMI.sql
\i tables/rhnServerEvent.sql
\i tables/rhnServerGroupMembers.sql
\i tables/rhnServerGroupNotes.sql
\i tables/rhnUserGroup.sql
\i tables/rhnUserGroup_sequences.sql
\i tables/rhnSnapshotServerGroup.sql
\i tables/rhnServerGroupTypeFeature.sql
\i tables/rhnServerHistory.sql
\i tables/rhnServerInfo.sql
\i tables/rhnServerInstallInfo.sql
\i tables/rhnServerLocation.sql
\i tables/rhnServerLock.sql
\i tables/rhnServerMessage.sql
\i tables/rhnServerNeededErrataCache.sql
\i tables/rhnServerNeededPackageCache.sql
\i tables/rhnServerNetwork.sql
\i tables/rhnServerNotes.sql
\i tables/rhnServerPackageArchCompat.sql
\i tables/rhnServerPackage.sql
\i tables/rhnServerPath.sql
\i tables/rhnServerPreserveFileList.sql
\i tables/rhnServerProfilePackage.sql
\i tables/rhnServerServerGroupArchCompat.sql
\i tables/rhnServerTokenRegs.sql
\i tables/rhnServerUuid.sql
\i tables/rhnSGTypeBaseAddonCompat.sql
\i tables/rhnSGTypeVirtSubLevel.sql
\i tables/rhnSnapshotPackage.sql
\i tables/rhnSnapshotTag.sql
\i tables/rhnSNPErrataQueue.sql
\i tables/rhnSNPServerQueue.sql
\i tables/rhnSolarisPackage.sql
\i tables/rhnSolarisPatchedPackage.sql
\i tables/rhnSolarisPatchPackages.sql
\i tables/rhnSolarisPatchSet.sql
\i tables/rhnSolarisPatchSetMembers.sql
\i tables/rhnSolarisPatchType.sql
\i tables/rhnSolarisPatch.sql
\i tables/rhnSystemMigrations.sql
\i tables/rhnTaskQueue.sql
\i tables/rhnTemplateCategory.sql
\i tables/rhnTemplateString.sql
\i tables/rhnTextMessage.sql
\i tables/rhnTransactionElement.sql
\i tables/rhnTrustedOrgs.sql
\i tables/rhnUserDefaultSystemGroups.sql
\i tables/rhnUserGroupMembers.sql
\i tables/rhnUserInfoPane.sql
\i tables/rhnUserMessageStatus.sql
\i tables/rhnUserMessage.sql
\i tables/rhnUserMessageType.sql
\i tables/rhnUserReserved.sql
\i tables/rhnUserServerGroupPerms.sql
\i tables/rhnUserServerPerms.sql
\i tables/rhnUserServerPrefs.sql
\i tables/rhnVersionInfo.sql
\i tables/rhnVirtualInstance.sql
\i tables/rhnVirtualInstanceEventType.sql
\i tables/rhnVirtualInstanceState.sql
\i tables/rhnVirtualInstanceEventLog.sql
\i tables/rhnVirtualInstanceType.sql
\i tables/rhnVirtualInstanceInfo.sql
\i tables/rhnVirtualInstanceInstallLog.sql
\i tables/rhnVisibleObjects.sql
\i tables/rhnWebContactChangeState.sql
\i tables/rhnWebContactChangeLog.sql
\i tables/state_change.sql
\i tables/time_series.sql
\i tables/valid_countries.sql
-- \i tables/valid_countries_tl.sql
\i tables/web_customer_notification.sql
\i tables/web_user_contact_permission.sql
\i tables/web_user_site_type.sql
\i tables/web_user_site_info.sql

/* triggers go here */
\i triggers/rhnOrgQuota.sql
\i triggers/rhnSatelliteCert.sql
\i triggers/web_contact.sql

/* functions go here */
\i procs/empty_blob.sql
\i procs/create_first_org.sql
\i procs/sequence_nextval.sql
\i procs/sequence_currval.sql
\i procs/lookup_package_key_type.sql
\i procs/create_pxt_session.sql
\i procs/truncateCacheQueue.sql
\i procs/lookup_cf_state.sql
\i procs/queue_errata.sql
\i procs/lookup_arch_type.sql
\i procs/lookup_feature_type.sql
\i procs/lookup_package_provider.sql
\i procs/delete_server_bulk.sql

/* Data population scripts go here */
\i tables/rhnUserGroupType_data.sql

/* packages go here */
\i packages/rhn_user.pkb

/* views go here */
\i views/rhnOrgChannelFamilyPermissions.sql
-- \i views/rhn_contact_monitoring.sql
\i views/rhn_customer_monitoring.sql
-- \i views/rhn_host_monitoring.sql
\i views/rhnActionOverview.sql
\i views/rhnOrgChannelTreeView.sql
\i views/rhnSharedChannelView.sql
\i views/rhnSharedChannelTreeView.sql
-- \i views/rhnAvailableChannels.sql
\i views/rhnCDDevice.sql
\i views/rhnChannelFamilyOverview.sql
\i views/rhnChannelFamilyPermissions.sql
\i views/rhnServerEntitlementView.sql
\i views/rhnChannelFamilyServerPhysical.sql
\i views/rhnChannelFamilyServers.sql
\i views/rhnChannelFamilyServerVirtual.sql
-- \i views/rhnChannelNewestPackageView.sql
-- \i views/rhnChannelPackageOverview.sql
\i views/rhnChannelPermissions.sql
\i views/rhnChannelTreeView.sql
-- \i views/rhnDemoOrgs.sql
\i views/rhnEntitledServers.sql
-- \i views/rhnHistoryView_refresh.sql
-- \i views/rhnHistoryView_packages.sql
-- \i views/rhnHistoryView_errata.sql
-- \i views/rhnHistoryView.sql
\i views/rhnHWDevice.sql
-- \i views/rhnOrgErrata.sql
-- \i views/rhnOrgPackageOverview.sql
-- \i views/rhnPaidOrgs.sql
\i views/rhnWebContactDisabled.sql
-- \i views/rhnPrivateErrataMail.sql
\i views/rhnServerEntitlementPhysical.sql
\i views/rhnServerEntitlementVirtual.sql
\i views/rhnServerErrataTypeView.sql
\i views/rhnServerFeaturesView.sql
\i views/rhnServerGroupMembership.sql
\i views/rhnUserManagedServerGroups.sql
\i views/rhnServerGroupOverview.sql
\i views/rhnServerGroupOVLiteHelper.sql
-- \i views/rhnServerNeededPackageView.sql
-- \i views/rhnServerOutdatedPackages.sql
\i views/rhnVisibleServerGroupMembers.sql
\i views/rhnServerOverview.sql
\i views/rhnStorageDevice.sql
\i views/rhnUserActionOverview.sql
\i views/rhnUserAppletOverview.sql
\i views/rhnUserChannelFamilyPerms.sql
\i views/rhnUserChannelTreeView.sql
-- \i views/rhnUserAvailableChannels.sql
-- \i views/rhnUserChannel.sql
\i views/rhnUserGroupMembership.sql
\i views/rhnUserServerPermsDupes.sql
\i views/rhnVisibleServerGroup.sql
\i views/rhnUserTypeBase.sql
\i views/rhnUserTypeCommaView.sql
\i views/rhnUsersInOrgOverview.sql
\i views/rhnVisServerGroupMembership.sql
\i views/rhnVisServerGroupOverviewLite.sql
\i views/rhnVisServerGroupOverview.sql
\i views/rhnWebContactEnabled.sql

commit;

