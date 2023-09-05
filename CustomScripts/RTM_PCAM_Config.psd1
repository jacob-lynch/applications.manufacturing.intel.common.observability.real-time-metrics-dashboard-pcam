@{
install_dir="\d$\temp\cicd_releases\RTM_PCAM"
#----- primary domain of dashboard domain
domain='PCAM'
#----- secondary domain of dashboard (place "none" if not exists)
domain1="none"
releaseName='RTM.Dashboard.PCAM'
RF3STG = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="rf3sap216n3.rf3stg.mfgint.intel.com"
    JOBS_PATH="\t$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="rf3sap216n3.rf3stg.mfgint.intel.com"
    JOBS_AUDIT_PATH="\t$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    JOBS_NODE_BACKUP="rf3svap616n19.rf3stg.mfgint.intel.com" 
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="rf3sap216n3.rf3stg.mfgint.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="rf3sap216n3.rf3stg.mfgint.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config')
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.sql')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="RF3STG"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','hendrix.hartana@intel.com') )
    smtpTo = @('ricarda.louk@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
F32INT = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="f32iap216n4.f32int.mfgint.intel.com"
    JOBS_PATH="\T$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="f32iap216n4.f32int.mfgint.intel.com"
    JOBS_AUDIT_PATH="\T$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    JOBS_NODE_BACKUP="f32ivap616n1.f32int.mfgint.intel.com" 
    #JOBS_NODE_BACKUP="none"
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="f32iap216n3.f32int.mfgint.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="f32iap216n3.f32int.mfgint.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config')
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.sql')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="F32INT"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','hendrix.hartana@intel.com') )
    smtpTo = @('ricarda.louk@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
F28PROD = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="f28pap216n13.f28prod.mfg.intel.com" 
    JOBS_PATH="\T$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="f28pap216n13.f28prod.mfg.intel.com" 
    JOBS_AUDIT_PATH="\T$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    #JOBS_NODE_BACKUP="f28pvap616n19.f28prod.mfg.intel.com" 
    JOBS_NODE_BACKUP="none"
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="f28pap216n11.f28prod.mfg.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="f28pap216n11.f28prod.mfg.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes (e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config') )
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.dummy')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="F28PROD"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','kar.seng.wong@intel.com') )
    smtpTo = @('ricarda.louk@intel.com','mit.pi.hub.capabilities.and.operations@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
F21PROD = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="f21pvap416n19.f21prod.mfg.intel.com" 
    JOBS_PATH="\D$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="f21pvap416n19.f21prod.mfg.intel.com" 
    JOBS_AUDIT_PATH="\D$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    JOBS_NODE_BACKUP="none" 
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="f21pap216n11.f21prod.mfg.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="f21pap216n11.f21prod.mfg.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes (e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config') )
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.dummy')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="F21PROD"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','kar.seng.wong@intel.com') )
    smtpTo = @('ricarda.louk@intel.com','mit.pi.hub.capabilities.and.operations@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
F24PROD = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="f24pvap416n19.f24prod.mfg.intel.com" 
    JOBS_PATH="\D$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="f24pvap416n19.f24prod.mfg.intel.com" 
    JOBS_AUDIT_PATH="\D$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    JOBS_NODE_BACKUP="none" 
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="f24pap216n11.f24prod.mfg.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="f24pap216n11.f24prod.mfg.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes (e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config') )
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.dummy')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="F24PROD"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','kar.seng.wong@intel.com') )
    smtpTo = @('ricarda.louk@intel.com','mit.pi.hub.capabilities.and.operations@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
F32PROD = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="f32pvap416n19.f32prod.mfg.intel.com" 
    JOBS_PATH="\D$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="f32pvap416n19.f32prod.mfg.intel.com" 
    JOBS_AUDIT_PATH="\D$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    JOBS_NODE_BACKUP="none" 
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="f32pap216n11.f32prod.mfg.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="f32pap216n11.f32prod.mfg.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes (e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config') )
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.dummy')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="F32PROD"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','kar.seng.wong@intel.com') )
    smtpTo = @('ricarda.louk@intel.com','mit.pi.hub.capabilities.and.operations@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
F68PROD = @{
    #----- primary jobs Dashboard node (file staging, overwrites, audit will happen on this node)
    JOBS_NODE="f68pvap416n19.f68prod.mfg.intel.com" 
    JOBS_PATH="\D$\Dashboard\Jobs"
    #----- jobs Audit node (usually same as JOBS_NODE) - if you are moving from a different node this path will be used only for comparison
    JOBS_AUDIT_NODE="f68pvap416n19.f68prod.mfg.intel.com" 
    JOBS_AUDIT_PATH="\D$\Dashboard\Jobs"
    #----- jobs Backup node (copy of the primary job node) - if you don't have a backup node please place "none"
    JOBS_NODE_BACKUP="none" 
    JOBS_BACKUP_PATH="\D$\Dashboard\Jobs"
    #----- primary web Dashboard node 
    WEB_NODE="f68pap216n11.f68prod.mfg.intel.com"
    WEB_PATH="\r$\Dashboard\Web"
    #----- web Audit node (usually same as WEB_NODE) - if you are moving from a different node this path will be used only for comparison
    WEB_AUDIT_NODE="f68pap216n11.f68prod.mfg.intel.com"
    WEB_AUDIT_PATH="\r$\Dashboard\Web"
    #----- web Backup node (copy of the primary web node) - if you don't have a backup node please place "none"
    WEB_NODE_BACKUP="none"
    WEB_BACKUP_PATH="\r$\Dashboard\Web"
    #----- Files to exclude when copying from install directory to primary nodes (e.g. EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config') )
    EXCLUDE_FILES_INSTALL_COPY=@('*.sql','web.config','pcam.sitemap')
    #----- Files to exclude when copying from primary dashboard node to secondary dashboard node (if relevant)
    EXCLUDE_FILES_BACKUP_COPY=@('*.dummy')
    #----- needed for AUDIT to replace TD domain with local domain name
    SQL_POSTFIX_D1D="RF3PROD"
    SQL_POSTFIX_LOCAL="F68PROD"
    #----- you can specify multiple emails for completion notification (e.g. smtpTo = @('ricarda.louk@intel.com','kar.seng.wong@intel.com') )
    smtpTo = @('ricarda.louk@intel.com','mit.pi.hub.capabilities.and.operations@intel.com')
    smtpFrom ="sys_cicd@intel.com"
    #----- credentials for Scheduled task setup
    SchedTaskPath="\Dashboard\PCAM\"
}
}
